# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 01.1: Square a number

Implement square(uint256 n). Expect 0 → 0, 4 → 16. A result larger than uint256 must revert under checked arithmetic.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 01.2: Whole percentage

Implement percentage(uint256 amount, uint256 rate), accepting rate 0..100. Return amount * rate / 100, rounded down. Expect (99,10) → 9; rate 101 reverts. Multiplication overflow may revert.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 01.3: Safe narrowing

Implement toUint8(uint256 n). Accept 0..255 and reject larger values before converting. Check 255 succeeds and 256 reverts.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** Multiplication gives n squared. Checked arithmetic rejects unrepresentable results rather than silently wrapping.

**Exercise 2.** The rate check enforces the percentage domain. Multiplying before dividing retains more precision for ordinary inputs; the final division rounds down.

**Exercise 3.** The range check happens before conversion. Without that check, converting a wider integer to uint8 can discard high bits.
