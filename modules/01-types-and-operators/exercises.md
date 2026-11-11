# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 01.1: Square a number — Warm-up

Implement square(uint256 n). Expect 0 → 0, 4 → 16. A result larger than uint256 must revert under checked arithmetic.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 01.2: Whole percentage — Application

Implement percentage(uint256 amount, uint256 rate), accepting rate 0..100. Return amount * rate / 100, rounded down. Expect (99,10) → 9; rate 101 reverts. Multiplication overflow may revert.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 01.3: Safe narrowing — Challenge

Implement toUint8(uint256 n). Accept 0..255 and reject larger values before converting. Check 255 succeeds and 256 reverts.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
