# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 08.1: Edit a copy

Create stored data [2,4]. Implement withFirst(n) view returning a memory copy with first value n. withFirst(9) → [9,4], while data(0) remains 2.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 08.2: Edit through storage

Add setFirst(n) that uses a local storage reference to change the first element. After setFirst(8), data(0) must be 8.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 08.3: Demonstrate a memory alias

Implement aliasDemo() pure: allocate [1], assign it to a second memory variable, change the second variable element to 7, and return the first variable element. Expect 7; explain why.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** Storage-to-memory copying isolates edits to the returned copy. That is why withFirst can remain view.

**Exercise 2.** The storage local aliases the original array, so assignment through it persists.

**Exercise 3.** Both memory variables point to the same allocated array. Editing through b is therefore visible through a.
