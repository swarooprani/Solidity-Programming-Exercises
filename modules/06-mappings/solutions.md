# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 06.1: Record a score including zero

Implement setScore(id,score), getScore(id), scores and exists mappings. Allow scores 0..100. getScore on an unset ID reverts; setScore(5,0) then getScore(5) returns 0.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 06.2: Delete consistently

Add remove(id), clearing both score and existence. After removing ID 5, getScore(5) reverts. Removing an already absent ID may succeed without effect.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 06.3: Nested enrollment

Add join(courseId) and joined(address,courseId). A caller may join each course once; duplicates revert. A and B enrolling in course 7 must have independent entries. No fees or identity verification.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** A separate existence bool preserves the distinction between missing and explicitly scored zero. The score range is checked before either write.

**Exercise 2.** Clearing both mappings restores the absent-record state. Clearing only the score would leave inconsistent metadata.

**Exercise 3.** The two-level key separates users and courses. msg.sender prevents this join function from editing another user’s membership.
