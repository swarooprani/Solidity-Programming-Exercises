# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 04.1: Read the last item — Warm-up

Implement last(uint256[] calldata a). Reject empty input; [2,7] → 7. Use length - 1 only after checking the length.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 04.2: Swap two stored items — Application

In a contract initialized with [10,20,30], implement swap(i,j), length(), and public items. swap(0,2) produces [30,20,10]; swapping an index with itself is valid; invalid indexes revert.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 04.3: Check nonempty text — Challenge

Implement nonempty(string calldata text) returning whether its byte length is greater than zero. Empty string → false; a space → true. Do not claim this validates meaningful text.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
