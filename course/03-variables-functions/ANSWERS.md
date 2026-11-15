# Module 03 — Answers with explanations

### 1. Where does a state variable live?

**Answer:** In persistent contract storage.

### 2. Can immutable be reassigned in a normal function?

**Answer:** No.

### 3. What is the difference between pure and view?

**Answer:** pure cannot read or write state; view may read but not write state.

### 4. Does private conceal data from blockchain observers?

**Answer:** No.

### 5. Does adding a local variable persist across calls?

**Answer:** No; it exists only for its invocation.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)