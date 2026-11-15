# Module 15 — External contract calls and try/catch

**Prerequisite:** Module 14 · **Tools:** [Remix](https://remix.ethereum.org/) with simulated Remix VM accounts.

## Detailed concept notes

### 1. Trust boundaries

Calling another deployed contract executes code outside your direct control. That code may revert, consume gas, return unexpected values, or call back into your own contract. Treat user-provided target addresses as untrusted.

### 2. Typed calls

Declare an interface for the expected function and call it via a typed target. Typed calls are easier to inspect than low-level calls, but an interface is a description, not a guarantee that an address implements the intended behavior.

### 3. try/catch

A try/catch statement can handle an external call that reverts, letting your contract choose a fallback result. It does not catch all errors inside ordinary local expressions. Errors may still arise when evaluating arguments or decoding incompatible responses.

### 4. Low-level calls

address(target).call(encodedData) returns a bool indicating EVM-level success and raw bytes. A true success flag does not necessarily mean a meaningful business operation occurred. Avoid raw calls unless needed.

### 5. Reentrancy

An external call can hand control to an untrusted recipient, which might call back into your functions before the original call completes. Check access, update internal accounting first, then interact externally; consider dedicated guards for high-risk paths.

### 6. Testing failures

Deploy a correct target and test it, then deliberately call a target that reverts. Test zero addresses, unauthorized updates, and return-value assumptions in Remix VM.

## Annotated example

Open [Example.sol](Example.sol) and read the comments. Copy it into Remix, compile with a compatible Solidity compiler, deploy the named contract (or multiple contracts for interactions) using Remix VM, and follow the trace.

**Predict and run:** Deploy BoundedDoubler and SafeCaller. Call attempt(target,5) → (true,10). Call attempt(target,101) → (false,0). Try a zero target and see validation revert.

## Explain in your own words

1. Can a typed interface call revert?
2. What is a trust boundary?
3. What does try/catch mainly support here?

## Practice and review

[Exercises](EXERCISES.md) · [Quiz](QUIZ.md) · [Explained answers](ANSWERS.md) · [Reference solutions](Solutions.sol)

[← Previous](../14-ether-payable/README.md) · [Course index](../../TOPIC-INDEX.md) · [Next →](../16-abi-hashing/README.md)

> Learning examples only. Not security audited; do not use real Ether.