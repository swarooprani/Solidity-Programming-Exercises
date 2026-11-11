# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 04.1: Read the last item

Implement last(uint256[] calldata a). Reject empty input; [2,7] → 7. Use length - 1 only after checking the length.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 04.2: Swap two stored items

In a contract initialized with [10,20,30], implement swap(i,j), length(), and public items. swap(0,2) produces [30,20,10]; swapping an index with itself is valid; invalid indexes revert.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 04.3: Check nonempty text

Implement nonempty(string calldata text) returning whether its byte length is greater than zero. Empty string → false; a space → true. Do not claim this validates meaningful text.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The nonempty check prevents both subtraction from zero and an invalid read. The last valid index is length minus one.

**Exercise 2.** Both indexes are checked before assignment. Tuple assignment swaps the original values without overwriting one prematurely.

**Exercise 3.** A positive byte count distinguishes an empty byte sequence. A space is nonempty even though it may not be meaningful content.
