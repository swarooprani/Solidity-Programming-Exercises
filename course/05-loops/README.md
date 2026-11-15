# Module 05 — Loops, break, continue, and gas

**Prerequisite:** Module 04 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Why loops?

Loops repeat a block while a condition holds. Use them for small bounded input arrays, simple counts, and transformations. In smart contracts, every iteration consumes gas.

### 2. for loop

`for (initialization; condition; step) { ... }` is useful when you know the bound. The loop condition is checked before each iteration. `for (uint256 i = 0; i < n; i++)` starts at 0 and executes while i < n.

### 3. while loop

`while (condition) { ... }` evaluates the condition before running the body. If false initially, the body runs zero times. Ensure the body makes progress toward ending the loop.

### 4. do-while loop

`do { ... } while (condition);` executes the body at least once, because its condition is checked afterwards. Note the trailing semicolon.

### 5. break and continue

`break` exits the nearest loop; `continue` skips to the next iteration. They change control flow, so trace them carefully when predicting output.

### 6. Gas limits

Avoid loops over storage arrays whose size can grow without bound. An operation that works for five elements may become impossible within a block's gas limit for thousands. Prefer bounded chunks, pagination, or off-chain iteration for large data.

### 7. Off-by-one mistakes

For an array of length n, valid indices are 0 through n-1. `i <= n` visits n and typically accesses out-of-bounds. Use `i < n` to traverse an entire array.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Call sumTo(4) → 10; countOddBelow(8) → 4 (1,3,5,7); firstMultipleOfThree(10) → 3.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. How many times does a while loop execute if its condition begins false?
2. Which loop runs its body at least once?
3. What does continue do?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../04-operators-conditionals/README.md) · [Next →](../06-arrays-strings-bytes/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.

## Comparing the three loops

```solidity
// for: initialization, condition, update
uint256 sum;
for (uint256 i = 1; i <= 3; i++) { sum += i; } // sum = 6

// while: condition tested before each execution
uint256 n;
while (n < 3) { n++; } // n = 3

// do-while: body executes at least once
uint256 visits;
do { visits++; } while (visits < 3); // visits = 3
```

**Trace a for loop:** With `for (uint256 i = 0; i < 4; i++)`, values of i at the start of the body are 0, 1, 2 and 3. The condition becomes false at 4. This is why array traversal uses `i < array.length`, not `i <= array.length`.

**Trace continue:** `if (i % 2 == 0) continue;` skips the remaining body only for even i, and the loop proceeds to the next iteration. **Trace break:** `if (i == 5) break;` exits the innermost loop entirely. Neither returns from the function unless used with an explicit return.

**Gas safety:** a bounded for-loop on ten supplied values can be reasonable; a loop over an array that grows to millions of storage entries can cause permanent denial of service. Cap iterations and consider batches. Do not write a while-loop whose controlling variable never changes.