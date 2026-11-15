# Module 15 — Explained answers

### 1. Can a typed interface call revert?

**Answer:** Yes; a target may fail or not support the expected behavior.

### 2. What is a trust boundary?

**Answer:** A boundary at which code outside your control may execute.

### 3. What does try/catch mainly support here?

**Answer:** Handling supported external call failures.

### 4. What does a low-level call return?

**Answer:** A success flag plus bytes return data.

### 5. What is reentrancy?

**Answer:** Untrusted external code calls back before an earlier operation is complete.

## Practice solutions
The commented [Solutions.sol](Solutions.sol) gives a reference implementation for part of the programming practice. Open it only after testing your approach. Discussion questions demand reasoning about failure cases, not just executable code. Compare requirements and boundary behaviors rather than exact style.

[Lesson](README.md) · [Exercises](EXERCISES.md)