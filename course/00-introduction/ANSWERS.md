# Module 00 — Answers with explanations

### 1. Does compiling source code deploy a contract?

**Answer:** No. Compilation generates artifacts; deployment requires a transaction.

### 2. What does Remix VM provide?

**Answer:** A local simulated blockchain and funded test accounts, not real ETH.

### 3. Does editing a source file update an already deployed contract?

**Answer:** No. A deployed instance retains its code.

### 4. Can separate deployments store different values?

**Answer:** Yes, each deployed address has separate state.

### 5. Are public-chain contract variables secret?

**Answer:** No; blockchain storage is generally observable.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)