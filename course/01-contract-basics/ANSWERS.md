# Module 01 — Answers with explanations

### 1. What does the pragma specify?

**Answer:** Allowed compiler versions, not a deployment target.

### 2. Does `public` on a state variable add a setter?

**Answer:** No, it creates a getter.

### 3. Which function can read state but not modify it?

**Answer:** A `view` function.

### 4. What does `returns (uint256)` mean?

**Answer:** The function's return value has type uint256.

### 5. Can compilation alone verify functional correctness?

**Answer:** No; behavior must be tested.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)