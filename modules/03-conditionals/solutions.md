# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 03.1: Find the larger value

Implement larger(a,b) returning the larger uint256; equal inputs return that value. Check (3,8) → 8 and (4,4) → 4.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 03.2: Progressive bill

Implement bill(units): first 100 cost 2 each, next 100 cost 3 each, remainder cost 5 each. Check 0 → 0, 100 → 200, 200 → 500, 250 → 750.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 03.3: Validate and classify age

Implement category(age), accepting 0..150. Return Child for <13, Teen for 13..19, Adult for 20..59, Senior for 60..150. Check every transition and reject 151.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The conditional expression returns the greater input and handles equality without a special case.

**Exercise 2.** Earlier slabs are charged at their fixed completed costs. Only units beyond the current threshold receive the higher rate.

**Exercise 3.** Rejecting ages above the exercise limit separates validation from classification. Ascending exclusive thresholds avoid gaps at 13, 20 and 60.
