// Real bytecode execution on an isolated, in-process EVM. No wallet or RPC secrets.
const fs = require('node:fs');
const path = require('node:path');
const assert = require('node:assert/strict');
// Keep the EVM's temporary database inside the ignored build directory.
const tempRoot = path.join(__dirname, '..', 'build', 'tmp');
fs.mkdirSync(tempRoot, { recursive: true });
process.env.TMPDIR = tempRoot;
process.env.TMP = tempRoot;
process.env.TEMP = tempRoot;
process.env.UWS_USE_FALLBACK = 'true';
const ganache = require('ganache');
const { ethers } = require('ethers');
const { compile } = require('./compile.cjs');
const tests = [];
const test = (name, body) => tests.push({ name, body });
const eq = (actual, expected) => assert.deepEqual(actual, expected);
const list = value => Array.from(value);
const tx = async action => (await action).wait();
async function rejects(action) {
  await assert.rejects(async () => {
    const result = await action();
    if (result && typeof result.wait === 'function') await result.wait();
  }, error => error.code === 'CALL_EXCEPTION');
}

async function main() {
  const contracts = compile(); // Never run tests against stale bytecode.
  const eip1193 = ganache.provider({
    logging: { quiet: true },
    chain: { hardfork: 'shanghai', chainId: 1337 },
    wallet: { totalAccounts: 55 },
    miner: { instamine: 'eager' }
  });
  const provider = new ethers.BrowserProvider(eip1193, undefined, { cacheTimeout: -1 });
  provider.pollingInterval = 10;
  const signers = await Promise.all(Array.from({ length: 55 }, (_, i) => provider.getSigner(i)));
  const [a, b, c] = signers;
  const [A, B, C] = await Promise.all([a, b, c].map(s => s.getAddress()));
  async function deploy(name, ...args) {
    const matches = Object.values(contracts).filter(cs => cs[name]).map(cs => cs[name]);
    assert.equal(matches.length, 1, `Unique artifact required for ${name}`);
    const artifact = matches[0];
    const deployed = await new ethers.ContractFactory(artifact.abi, artifact.evm.bytecode.object, a).deploy(...args);
    await deployed.waitForDeployment();
    return deployed;
  }

  test('00: independent deployments and persistent state', async () => {
    const x = await deploy('FirstStore'), y = await deploy('FirstStore');
    eq(await x.number(), 0n); await tx(x.set(42)); eq(await x.number(), 42n); eq(await y.number(), 0n);
    const s = await deploy('StartSolutions');
    await tx(s.setScore(7)); await tx(s.visit()); await tx(s.visit()); eq(await s.visits(), 2n);
    await tx(s.resetVisits()); eq(await s.visits(), 0n); eq(await s.score(), 7n);
  });
  test('01: integer arithmetic, percentage rounding and narrowing bounds', async () => {
    const e = await deploy('TypeExamples');
    eq(list(await e.quotientAndRemainder(7, 2)), [3n, 1n]); await rejects(() => e.quotientAndRemainder(7, 0));
    eq(await e.isEven(0), true); eq(await e.oneEtherInWei(), 10n ** 18n);
    const s = await deploy('TypeSolutions');
    eq(await s.square(4), 16n); eq(await s.square(0), 0n); await rejects(() => s.square(ethers.MaxUint256));
    eq(await s.percentage(99, 10), 9n); await rejects(() => s.percentage(10, 101));
    eq(await s.toUint8(255), 255n); await rejects(() => s.toUint8(256));
  });
  test('02: state, pure helpers and tuples', async () => {
    const e = await deploy('FunctionExamples');
    eq(await e.read(), 0n); await tx(e.increment()); eq(await e.read(), 1n); eq(await e.double(6), 12n);
    const s = await deploy('FunctionSolutions');
    await tx(s.set(8)); await tx(s.addDouble(3)); eq(await s.get(), 14n);
    eq(list(await s.minMax(9, 2)), [2n, 9n]); eq(list(await s.minMax(4, 4)), [4n, 4n]);
  });
  test('03: grade, age and progressive billing boundaries', async () => {
    const e = await deploy('ConditionalExamples');
    for (const [n, expected] of [[39, 'Fail'], [40, 'C'], [60, 'B'], [80, 'A'], [100, 'A']]) eq(await e.grade(n), expected);
    await rejects(() => e.grade(101));
    const s = await deploy('ConditionalSolutions'); eq(await s.larger(3, 8), 8n); eq(await s.larger(4, 4), 4n);
    for (const [n, expected] of [[0, 0], [100, 200], [200, 500], [250, 750]]) eq(await s.bill(n), BigInt(expected));
    for (const [n, expected] of [[12, 'Child'], [13, 'Teen'], [19, 'Teen'], [20, 'Adult'], [59, 'Adult'], [60, 'Senior'], [150, 'Senior']]) eq(await s.category(n), expected);
    await rejects(() => s.category(151));
  });
  test('04: array deletion, pop, bounds and text bytes', async () => {
    const e = await deploy('ArrayExamples'); await rejects(() => e.removeLast());
    await tx(e.append(7)); await tx(e.append(9)); await tx(e.clearAt(0));
    eq(await e.length(), 2n); eq(await e.items(0), 0n); await tx(e.removeLast()); eq(await e.length(), 1n);
    eq(await e.byteLength('cat'), 3n); eq(await e.byteLength('é'), 2n);
    const s = await deploy('ArraySolutions'); eq(await s.last([2, 7]), 7n); await rejects(() => s.last([]));
    await tx(s.swap(0, 2)); eq(await s.items(0), 30n); eq(await s.items(2), 10n);
    await tx(s.swap(1, 1)); eq(await s.items(1), 20n); await rejects(() => s.swap(0, 3));
    eq(await s.nonempty(''), false); eq(await s.nonempty(' '), true);
  });
  test('05: all loop forms, empty input, first match and length cap', async () => {
    const e = await deploy('LoopExamples'); eq(await e.sum([10, 20, 30]), 60n); eq(await e.sum([]), 0n);
    eq(await e.halves(10), 4n); eq(await e.halves(0), 0n); eq(await e.digits(0), 1n); eq(await e.digits(482), 3n);
    eq(await e.positivesBeforeZero([4, -2, 6, 0, 100]), 10n);
    const s = await deploy('LoopSolutions'); eq(await s.countEven([0, 1, 2, 4]), 3n); eq(await s.countEven([]), 0n);
    eq(list(await s.find([8, 4, 8], 8)), [true, 0n]); eq(list(await s.find([], 8)), [false, 0n]);
    eq(list(await s.reverse([1, 2, 3])), [3n, 2n, 1n]); eq(list(await s.reverse([])), []);
    await rejects(() => s.countEven(Array(101).fill(0))); await rejects(() => e.sum(Array(101).fill(0)));
  });
  test('06: default values, existence, deletion and nested keys', async () => {
    const e = await deploy('MappingExamples'); await tx(e.enroll()); eq(await e.enrolled(A), true);
    await rejects(() => e.enroll()); eq(await e.enrolled(B), false); await tx(e.leave()); eq(await e.enrolled(A), false);
    const s = await deploy('MappingSolutions'); await rejects(() => s.getScore(5));
    await tx(s.setScore(5, 0)); eq(await s.getScore(5), 0n); eq(await s.exists(5), true);
    await rejects(() => s.setScore(5, 101)); eq(await s.getScore(5), 0n);
    await tx(s.remove(5)); await rejects(() => s.getScore(5)); eq(await s.exists(5), false);
    await tx(s.join(7)); await rejects(() => s.join(7)); eq(await s.joined(A, 7), true); eq(await s.joined(B, 7), false);
    await tx(s.connect(b).join(7)); eq(await s.joined(B, 7), true);
  });
  test('07: records, missing IDs and state transitions', async () => {
    const e = await deploy('StructExamples'); await rejects(() => e.add(''));
    await tx(e.add('Read loops')); eq(list(await e.get(0)), ['Read loops', 0n]);
    await tx(e.complete(0)); eq((await e.get(0))[1], 1n); await rejects(() => e.complete(0));
    const s = await deploy('StructSolutions'); await rejects(() => s.borrow(1)); await rejects(() => s.addBook(1, ''));
    await tx(s.addBook(1, 'EVM')); await rejects(() => s.addBook(1, 'Other'));
    await tx(s.borrow(1)); await rejects(() => s.borrow(1)); await tx(s.giveBack(1)); await rejects(() => s.giveBack(1));
    await rejects(() => s.ship()); await tx(s.pay()); await rejects(() => s.pay()); await tx(s.ship()); eq(await s.stage(), 2n);
  });
  test('08: storage copies versus memory/storage aliases', async () => {
    const e = await deploy('LocationExamples'); eq(list(await e.copiedChange()), [99n, 20n]); eq(await e.values(0), 10n);
    await tx(e.aliasedChange()); eq(await e.values(0), 99n);
    const s = await deploy('LocationSolutions'); eq(list(await s.withFirst(9)), [9n, 4n]); eq(await s.data(0), 2n);
    await tx(s.setFirst(8)); eq(await s.data(0), 8n); eq(await s.aliasDemo(), 7n);
  });
  test('09: access, pausing and ownership handover', async () => {
    const e = await deploy('OwnerExamples', 5); await tx(e.setLimit(8)); await rejects(() => e.connect(b).setLimit(10)); eq(await e.limit(), 8n);
    const s = await deploy('AccessSolutions'); await rejects(() => s.connect(b).setValue(9));
    await tx(s.setValue(4)); await tx(s.setPaused(true)); await rejects(() => s.setValue(7)); eq(await s.value(), 4n);
    await rejects(() => s.transferOwner(ethers.ZeroAddress)); await tx(s.transferOwner(B));
    await rejects(() => s.setPaused(false)); await tx(s.connect(b).setPaused(false)); await tx(s.connect(b).setValue(9)); eq(await s.value(), 9n);
  });
  test('10: custom errors, event decoding and transaction rollback', async () => {
    const e = await deploy('ErrorEventExamples');
    const receipt = await tx(e.set(25)); const log = e.interface.parseLog(receipt.logs[0]);
    eq(log.name, 'ValueChanged'); eq(list(log.args), [A, 0n, 25n]);
    await assert.rejects(() => e.set.staticCall(101), error => {
      const decoded = e.interface.parseError(error.data); return decoded.name === 'TooLarge' && decoded.args[0] === 101n;
    }); eq(await e.value(), 25n);
    const s = await deploy('ErrorSolutions'); await tx(s.set(5)); await rejects(() => s.set(11));
    // Force a mined revert rather than relying only on gas-estimation rejection.
    try { await tx(s.attemptThenFail(9, { gasLimit: 100000 })); assert.fail('Expected revert'); }
    catch (error) { eq(error.code, 'CALL_EXCEPTION'); eq(error.receipt.status, 0); eq(error.receipt.logs.length, 0); }
    eq(await s.value(), 5n);
  });
  test('11: overrides, super and concrete implementations', async () => {
    eq(await (await deploy('BaseGreeting')).greeting(), 'Hello');
    const e = await deploy('FriendlyGreeting'); eq(await e.greeting(), 'Welcome'); eq(await e.number(), 15n);
    eq(await (await deploy('BaseFee')).fee(), 5n); eq(await (await deploy('StudentFee')).fee(), 2n);
    eq(await (await deploy('PremiumFee')).fee(), 8n); eq(await (await deploy('Rectangle', 3, 4)).area(), 12n);
    eq(await (await deploy('Rectangle', 0, 4)).area(), 0n);
  });
  test('12: interface composition and internal libraries', async () => {
    const src = await deploy('ValueSource'); const e = await deploy('ValueConsumer', await src.getAddress()); eq(await e.doubled(), 42n);
    const s = await deploy('LibrarySolutions'); eq(await s.capped(12, 10), 10n); eq(await s.capped(4, 10), 4n);
    const fee = await deploy('FixedFeeSource'); const consumer = await deploy('FeeConsumer', await fee.getAddress()); eq(await consumer.quote(), 7n);
    await rejects(() => deploy('FeeConsumer', ethers.ZeroAddress));
  });
  test('13: deposits, liabilities, withdrawals and rejection rollback', async () => {
    const e = await deploy('DepositExamples'); await rejects(() => e.deposit()); await tx(e.deposit({ value: 100 }));
    eq(await e.credit(A), 100n); eq(await e.contractBalance(), 100n);
    const s = await deploy('EtherSolutions'); await tx(s.deposit({ value: 3 })); await tx(s.deposit({ value: 7 }));
    eq(await s.balanceOf(A), 10n); eq(await s.balanceOf(B), 0n); eq(await s.liabilities(), 10n);
    const receipt = await tx(s.withdraw(4)); eq(s.interface.parseLog(receipt.logs[0]).name, 'Withdrawn');
    eq(await s.balanceOf(A), 6n); eq(await s.liabilities(), 6n); await rejects(() => s.withdraw(7)); await rejects(() => s.withdraw(0));
    const reject = await deploy('RejectingReceiver', await s.getAddress()); await tx(reject.fund({ value: 5 }));
    await rejects(() => reject.take(5)); eq(await s.balanceOf(await reject.getAddress()), 5n); eq(await s.liabilities(), 11n);
  });
  test('13: a malicious receiver cannot withdraw twice', async () => {
    const s = await deploy('EtherSolutions'); const attacker = await deploy('ReentrantReceiver', await s.getAddress());
    await tx(s.deposit({ value: 20 })); await tx(attacker.fund({ value: 5 })); await tx(attacker.take(5));
    eq(await attacker.attempted(), true); eq(await attacker.nestedSucceeded(), false);
    eq(await s.balanceOf(await attacker.getAddress()), 0n); eq(await s.balanceOf(A), 20n); eq(await s.liabilities(), 20n);
    eq(await provider.getBalance(await s.getAddress()), 20n);
  });
  test('14: typed failures, caller context and low-level payloads', async () => {
    const service = await deploy('DivisionService'); const e = await deploy('CallExamples', await service.getAddress());
    eq(list(await e.safeDivide(9, 2)), [true, 4n]); eq(list(await e.safeDivide(9, 0)), [false, 0n]);
    const target = await deploy('CallerTarget'); eq(await target.who(), A);
    const s = await deploy('CallSolutions', await target.getAddress());
    eq(await s.forwardedCaller(), await s.getAddress()); eq(list(await s.attempt(4)), [true, 8n]); eq(list(await s.attempt(11)), [false, 0n]);
    eq(await s.rawWho.staticCall(), await s.getAddress()); await tx(s.rawWho()); await rejects(() => deploy('CallSolutions', A));
  });
  test('15: ABI encoding, hash domains and single-use reveals', async () => {
    const e = await deploy('EncodingExamples'); eq(list(await e.roundTrip(7, A)), [7n, A]);
    eq(await e.digest('hello'), ethers.keccak256(ethers.toUtf8Bytes('hello'))); eq(await e.selector(), '0xa9059cbb');
    const s = await deploy('HashSolutions');
    eq(await s.recordHash(7, 'EVM'), ethers.keccak256(ethers.AbiCoder.defaultAbiCoder().encode(['uint256', 'string'], [7, 'EVM'])));
    const salt = ethers.id('deterministic-test-salt-only'); const digest = await s.commitment(A, 42, salt);
    assert.notEqual(digest, await s.commitment(B, 42, salt));
    const other = await deploy('HashSolutions'); assert.notEqual(digest, await other.commitment(A, 42, salt));
    await rejects(() => s.reveal(42, salt)); await tx(s.commit(digest)); await rejects(() => s.reveal(43, salt));
    eq(await s.hasCommit(A), true); await rejects(() => s.connect(b).reveal(42, salt));
    await tx(s.reveal(42, salt)); eq(await s.hasCommit(A), false); await rejects(() => s.reveal(42, salt));
  });
  test('16: batch progress, clipped pages and completion', async () => {
    const e = await deploy('BatchExamples'); await rejects(() => e.process(0)); await rejects(() => e.process(11));
    for (const [n, expected] of [[10, 55], [20, 210], [25, 325]]) { await tx(e.process(10)); eq(await e.next(), BigInt(n)); eq(await e.total(), BigInt(expected)); }
    await rejects(() => e.process(1));
    const s = await deploy('GasSolutions'); eq(await s.remaining(), 5n);
    eq(list(await s.page(1, 3)), [20n, 30n, 40n]); eq(list(await s.page(5, 2)), []);
    await rejects(() => s.page(6, 2)); await rejects(() => s.page(0, 0)); await rejects(() => s.page(0, 4));
    for (const [n, expected] of [[2, 30], [4, 100], [5, 150]]) { await tx(s.process(2)); eq(await s.next(), BigInt(n)); eq(await s.total(), BigInt(expected)); }
    eq(await s.remaining(), 0n); await rejects(() => s.process(1)); eq(await s.total(), 150n);
  });
  test('17: point ledger test matrix', async () => {
    const e = await deploy('PointLedger'); await tx(e.issue(A, 10)); await tx(e.issue(B, 5));
    await rejects(() => e.connect(b).issue(B, 1)); await tx(e.transfer(B, 3));
    eq(await e.balanceOf(A), 7n); eq(await e.balanceOf(B), 8n); eq(await e.total(), 15n);
    await rejects(() => e.transfer(B, 8)); await tx(e.transfer(A, 2));
    await rejects(() => e.transfer(ethers.ZeroAddress, 1)); eq(await e.balanceOf(A), 7n); eq(await e.balanceOf(B), 8n);
  });
  test('17: supply bounds and 30 generated transfers preserve conservation', async () => {
    const s = await deploy('SecuritySolutions'); await tx(s.issue(A, 1000));
    await rejects(() => s.issue(A, 1)); await rejects(() => s.connect(b).issue(B, 0));
    const accounts = [A, B, C], actors = [a, b, c]; const expected = [1000n, 0n, 0n];
    let seed = 12345;
    for (let i = 0; i < 30; i++) {
      seed = (Math.imul(seed, 1664525) + 1013904223) >>> 0;
      const from = seed % 3, to = (seed >>> 8) % 3;
      const amount = BigInt(seed % 100) % (expected[from] + 1n);
      await tx(s.connect(actors[from]).transfer(accounts[to], amount));
      expected[from] -= amount; expected[to] += amount;
      const actual = await Promise.all(accounts.map(address => s.balances(address)));
      eq(actual, expected); eq(actual.reduce((sum, n) => sum + n, 0n), await s.total());
    }
    await rejects(() => s.transfer(B, 1001)); eq(await s.total(), 1000n);
  });

  test('Project: gradebook records, events and teacher permissions', async () => {
    const p = await deploy('Gradebook'); await rejects(() => p.total(1));
    const receipt = await tx(p.setMarks(1, 85, 90, 75)); eq(p.interface.parseLog(receipt.logs[0]).name, 'MarksSet');
    eq(await p.total(1), 250n); eq(await p.average(1), 83n); await rejects(() => p.connect(b).setMarks(1, 0, 0, 0));
    for (const marks of [[101, 0, 0], [0, 101, 0], [0, 0, 101]]) await rejects(() => p.setMarks(1, ...marks));
    eq(await p.total(1), 250n); await tx(p.setMarks(2, 0, 0, 0)); eq(await p.average(2), 0n);
    await tx(p.setMarks(1, 100, 100, 100)); eq(await p.total(1), 300n);
  });
  test('Project: library borrower identity and invalid transitions', async () => {
    const p = await deploy('BorrowerLibrary'); await rejects(() => p.borrow(1)); await rejects(() => p.getBook(1));
    await rejects(() => p.connect(b).addBook(1, 'EVM')); await rejects(() => p.addBook(1, ''));
    await rejects(() => p.addBook(1, 'x'.repeat(101))); await tx(p.addBook(1, 'Solidity'));
    await rejects(() => p.addBook(1, 'Duplicate')); await tx(p.connect(b).borrow(1));
    eq((await p.getBook(1))[1], B); await rejects(() => p.borrow(1)); await rejects(() => p.giveBack(1));
    await tx(p.connect(b).giveBack(1)); eq((await p.getBook(1))[1], ethers.ZeroAddress);
    await rejects(() => p.connect(b).giveBack(1)); await tx(p.borrow(1)); eq((await p.getBook(1))[1], A);
  });
  test('Project: event capacity, cancellation during closure and reopening', async () => {
    await rejects(() => deploy('EventRegistration', 0)); await rejects(() => deploy('EventRegistration', 101));
    const p = await deploy('EventRegistration', 2); await tx(p.register()); await tx(p.connect(b).register());
    eq(await p.remaining(), 0n); await rejects(() => p.register()); await rejects(() => p.connect(c).register());
    await rejects(() => p.connect(b).setOpen(false)); await tx(p.setOpen(false)); await tx(p.connect(b).cancel());
    eq(await p.remaining(), 1n); await rejects(() => p.connect(c).register()); await rejects(() => p.connect(b).cancel());
    await tx(p.setOpen(true)); await tx(p.connect(c).register()); eq(await p.count(), 2n); eq(await p.remaining(), 0n);
  });

  test('Original: grade calculator', async () => {
    const p = await deploy('StudentGradeCalculator'); await tx(p.enterMarks(85, 90, 75));
    eq(await p.calculateTotal(), 250n); eq(await p.calculateAverage(), 83n);
    await rejects(() => p.enterMarks(101, 0, 0)); eq(await p.calculateTotal(), 250n);
  });
  test('Original: electricity bill and age checker', async () => {
    const bill = await deploy('ElectricityBillCalculator'); eq(await bill.calculateBill(250), 750n); eq(await bill.calculateBill(0), 0n);
    const age = await deploy('AgeCategoryChecker');
    for (const [n, expected] of [[12, 'Child'], [13, 'Teenager'], [19, 'Teenager'], [20, 'Adult'], [59, 'Adult'], [60, 'Senior Citizen']]) eq(await age.checkAge(n), expected);
  });
  test('Original: library and inventory', async () => {
    const p = await deploy('LibraryBookManagement', 1); await tx(p.issueBook()); await rejects(() => p.issueBook());
    await tx(p.returnBook()); eq(await p.getAvailableBooks(), 1n); await rejects(() => p.returnBook());
    const inv = await deploy('ProductInventoryManagement', 'Pen', 10); await tx(inv.addStock(5)); await tx(inv.sellProduct(4));
    eq(await inv.getCurrentStock(), 11n); await rejects(() => inv.sellProduct(12)); await rejects(() => inv.addStock(0));
  });
  test('Original: attendance, salary and quiz score', async () => {
    const at = await deploy('AttendanceManagement'); eq(list(await at.checkAttendance(1)), [false, false]);
    await tx(at.markAbsent(1)); eq(list(await at.checkAttendance(1)), [true, false]);
    await tx(at.markPresent(1)); eq(list(await at.checkAttendance(1)), [true, true]);
    const sal = await deploy('EmployeeSalaryManagement'); await rejects(() => sal.connect(b).setSalary(1, 10));
    await rejects(() => sal.setSalary(1, 0)); await tx(sal.setSalary(1, 10)); eq(await sal.getSalary(1), 10n);
    const q = await deploy('SimpleQuizScoreManagement'); await rejects(() => q.getScore(1)); await rejects(() => q.enterScore(1, 21));
    await rejects(() => q.connect(b).enterScore(1, 10)); await tx(q.enterScore(1, 0)); eq(await q.getScore(1), 0n); eq(await q.hasPassed(1), false);
    await tx(q.enterScore(1, 10)); eq(await q.hasPassed(1), true);
  });
  test('Original: event rejects duplicates and the 51st address', async () => {
    const p = await deploy('OnlineEventRegistration'); await tx(p.register()); await rejects(() => p.register());
    for (let i = 1; i < 50; i++) await tx(p.connect(signers[i]).register());
    eq(await p.totalRegistrations(), 50n); eq(await p.remainingSeats(), 0n);
    await rejects(() => p.connect(signers[50]).register()); eq(await p.totalRegistrations(), 50n);
  });

  let passed = 0;
  const results = [];
  try {
    for (const { name, body } of tests) {
      try { await body(); passed++; results.push({ name, passed: true }); console.log(`PASS ${name}`); }
      catch (error) { results.push({ name, passed: false, error: String(error) }); console.error(`FAIL ${name}\n`, error); }
    }
  } finally {
    provider.destroy(); await eip1193.disconnect();
  }
  const report = { passed, total: tests.length, results };
  fs.writeFileSync(path.join(__dirname, '..', 'build', 'test-summary.json'), JSON.stringify(report, null, 2));
  console.log(`${passed}/${tests.length} test groups passed.`);
  if (passed !== tests.length) process.exitCode = 1;
}
main().catch(error => { console.error(error); process.exitCode = 1; });
