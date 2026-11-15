# Module 04 — Answers with explanations

### 1. What is 7 / 2 for uint256 operands?

**Answer:** 3 because integer division truncates.

### 2. What is the difference between = and ==?

**Answer:** = assigns; == compares equality.

### 3. Is 100 in the condition units <= 100?

**Answer:** Yes, the upper boundary is inclusive.

### 4. How much does a 250-unit progressive bill cost at rates 2/3/5?

**Answer:** 750, because different ranges use different rates.

### 5. What happens when require(false, ...) is reached?

**Answer:** The call reverts, and state changes from that call do not persist.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)