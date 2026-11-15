# Module 02 — Answers with explanations

### 1. What range does uint8 represent?

**Answer:** 0 through 255 inclusive.

### 2. What does the default bool mapping entry return?

**Answer:** false.

### 3. Does uint256 represent -1?

**Answer:** No, it is unsigned.

### 4. Why check range before a narrow cast?

**Answer:** It can otherwise truncate high-order bits and change the numeric value.

### 5. How many wei equal one ether?

**Answer:** 10^18 wei.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)