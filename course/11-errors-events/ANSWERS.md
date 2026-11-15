# Module 11 — Answers and reasoning

### 1. Does state update survive a revert?

**Answer:** No, it is rolled back.

### 2. When is assert intended to be used?

**Answer:** For internal invariants that should not be violated.

### 3. What are indexed event fields useful for?

**Answer:** Filtering log topics off-chain.

### 4. Can a smart contract directly query all its past events?

**Answer:** No; logs are not its ordinary accessible state.

### 5. Does a reverted call keep its event logs?

**Answer:** No. Logs are rolled back with the call.

## Exercise review
The worked [Solutions.sol](Solutions.sol) demonstrates one reference implementation. Compare inputs, required restrictions, storage changes and boundary behavior with your own version. The discussion challenges require a written explanation, not just a Solidity file.

[Exercises](EXERCISES.md) · [Lesson](README.md)