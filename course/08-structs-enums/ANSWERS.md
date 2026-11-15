# Module 08 — Answers with explanations

### 1. What is a struct for?

**Answer:** Grouping related typed fields into one record.

### 2. What does an enum default to?

**Answer:** Its first declared member.

### 3. Can an enum directly enforce valid transitions?

**Answer:** No, the functions must check transition rules.

### 4. Can a mapping store structs?

**Answer:** Yes.

### 5. Why track existence inside a struct?

**Answer:** An unset struct otherwise reads as default field values.

## Exercises
- **Exercise A:** start from the smallest working contract; check state and input types before adding behavior.
- **Exercise B:** compare against [Solutions.sol](Solutions.sol) and focus on valid inputs and boundaries.
- **Exercise C:** verify your requirements and deliberately test the invalid path. Where an answer is an explanation rather than code, justify it using the concepts in the lesson.

The reference implementation is **one possible solution**, not the only correct approach. Be sure that your own solution meets the written requirements.

[Lesson](README.md) · [Exercises](EXERCISES.md)