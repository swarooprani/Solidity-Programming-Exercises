# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 11.1: Override a fee — Warm-up

Create BaseFee.fee() public pure virtual returning 5, and StudentFee overriding it to return 2. Deploy each and compare.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 11.2: Extend with super — Application

Create PremiumFee inheriting BaseFee. Its fee returns super.fee() + 3, so the result is 8. Do not hard-code 8 in the implementation.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 11.3: Implement an abstraction — Challenge

Create abstract Area with area() public view virtual returning uint256. Rectangle stores width and height supplied at construction and implements area(). Deploy with (3,4) → 12; (0,4) → 0. Arithmetic overflow reverts.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
