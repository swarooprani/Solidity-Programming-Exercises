# Module 09 — Answers with explanations

### 1. Does editing a memory copy update storage automatically?

**Answer:** No.

### 2. Can calldata input arrays be modified in place?

**Answer:** No, calldata is read-only.

### 3. What does a local storage reference point to?

**Answer:** The underlying persistent storage data.

### 4. Do uint256 parameters require explicit calldata?

**Answer:** No; uint256 is a value type.

### 5. Which location normally suits read-only external array parameters?

**Answer:** calldata.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)