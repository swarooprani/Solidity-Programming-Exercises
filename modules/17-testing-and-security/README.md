# 17. Testing behavior and security properties

Prerequisite: [Previous module](../16-gas-and-batching/README.md)

## Learning outcomes

- Test valid behavior, invalid behavior and state preservation.
- Write invariants and sequence-based tests.
- Separate educational correctness from production assurance.

## Explanation

A useful test begins with a claim: an unauthorized caller cannot mint points; a failed transfer leaves balances unchanged; a successful transfer preserves total supply. Write the expected behavior before reading the implementation. Checking only that a transaction succeeded misses many bugs.

Use example tests for known inputs, boundary tests around limits, negative tests for invalid requests, and sequence tests involving several actions and users. Fuzz tests generate many inputs within specified domains. Invariant tests check a property across sequences, such as conservation of supply. Passing a handful of examples is not equivalent to fuzzing or a security audit.

The point ledger below is not an ERC-20 token. It demonstrates caller permissions and conservation without real money. Its public total equals the sum of all issued point balances because only the owner can issue and transfers move existing points. Test this across a finite set of known participating accounts; a test cannot enumerate a mapping by itself.

Review the threat model: who may act, what do they control, which calls leave the contract, and what must never happen? Consider unauthorized writes, missing existence checks, incorrect units, unbounded work and reentrancy. Never treat private fields, timestamps or hashing as security features they do not provide. Before handling real assets, use maintained libraries, current compiler guidance, broader testing and independent review.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Owner issues A=10 and B=5, so total=15. A transfers 3 to B → A=7,B=8,total=15. A attempts 8 → revert and balances stay 7 and 8. A self-transfer must preserve A's balance.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/security-considerations.html)
- [Official reference 2](https://nodejs.org/api/test.html)

[Previous module](../16-gas-and-batching/README.md) | [Course home](../../README.md) | [Capstone projects](../../projects/README.md)
