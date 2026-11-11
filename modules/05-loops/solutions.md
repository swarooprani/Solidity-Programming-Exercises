# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 05.1: Count even numbers

Implement countEven(a), allowing at most 100 uint256 items. Count zeros as even. [] → 0; [0,1,2,4] → 3. Reject 101 items.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 05.2: Search with an explicit result

Implement find(a,target) returning (found,index), with at most 100 items. [8,4,8],8 → (true,0); missing → (false,0). Return the first match; distinguish missing from index zero.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 05.3: Reverse a copy

Implement reverse(a) returning a new memory array, with at most 100 items. [1,2,3] → [3,2,1]; [] → []. Leave the input unchanged.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** Every element is inspected once; modulo two includes zero as even. The input length check bounds the work.

**Exercise 2.** Returning immediately on a match chooses the first occurrence. The bool distinguishes index zero from absence.

**Exercise 3.** The result has the same length as the input. Destination i reads source length-1-i; the empty case never evaluates that subtraction.
