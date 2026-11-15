# Module 17 — Explained answers

### 1. Why is a loop over an unbounded array a problem?

**Answer:** Its gas needs may grow beyond transaction limits.

### 2. Does compilation prove correctness?

**Answer:** No.

### 3. What is an invariant?

**Answer:** A rule that must hold across every valid state transition.

### 4. Why test failed calls?

**Answer:** To verify rejection and rollback of state.

### 5. What is CEI?

**Answer:** Checks, Effects, Interactions—a pattern for reducing risks around external calls.

## Practice solutions
The commented [Solutions.sol](Solutions.sol) gives a reference implementation for part of the programming practice. Open it only after testing your approach. Discussion questions demand reasoning about failure cases, not just executable code. Compare requirements and boundary behaviors rather than exact style.

[Lesson](README.md) · [Exercises](EXERCISES.md)