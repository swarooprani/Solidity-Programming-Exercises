# Module 10 — Answers and reasoning

### 1. When does a constructor run?

**Answer:** Once, during deployment.

### 2. What does msg.sender identify?

**Answer:** The immediate caller of the current function.

### 3. What does the underscore in a modifier do?

**Answer:** Runs the protected function body at that point.

### 4. Does private mean hidden on Ethereum?

**Answer:** No. Blockchain state is generally observable.

### 5. What does an unauthorized require failure do?

**Answer:** Reverts the call and its attempted state changes.

## Exercise review
The worked [Solutions.sol](Solutions.sol) demonstrates one reference implementation. Compare inputs, required restrictions, storage changes and boundary behavior with your own version. The discussion challenges require a written explanation, not just a Solidity file.

[Exercises](EXERCISES.md) · [Lesson](README.md)