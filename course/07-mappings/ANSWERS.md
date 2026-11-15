# Module 07 — Answers with explanations

### 1. What is the default value of an unset mapping(uint256 => bool) entry?

**Answer:** false.

### 2. Can you obtain all mapping keys from a built-in method?

**Answer:** No.

### 3. Why add an `exists` field?

**Answer:** To distinguish a valid default value from a missing record.

### 4. What does delete map[key] do?

**Answer:** Resets that value to its type's default.

### 5. Can users read public mapping data?

**Answer:** Yes, through public getters; on-chain storage is also observable.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)