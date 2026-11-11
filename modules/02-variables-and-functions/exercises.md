# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 02.1: Store a value — Warm-up

Create a private value, set(uint256), and get() view. Check fresh 0, set(8) → get() 8. Explain why private does not hide the value from blockchain observers.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 02.2: Return a tuple — Application

Implement minMax(uint256 a, uint256 b) pure returning the smaller and larger values. Check (9,2) → (2,9), and equal values.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 02.3: Reuse a helper — Challenge

Implement addDouble(uint256 n) that adds twice n to the stored value using an internal pure _twice helper. With value 8, addDouble(3) gives 14. Overflow reverts.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
