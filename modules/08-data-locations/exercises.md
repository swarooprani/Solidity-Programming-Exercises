# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 08.1: Edit a copy — Warm-up

Create stored data [2,4]. Implement withFirst(n) view returning a memory copy with first value n. withFirst(9) → [9,4], while data(0) remains 2.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 08.2: Edit through storage — Application

Add setFirst(n) that uses a local storage reference to change the first element. After setFirst(8), data(0) must be 8.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 08.3: Demonstrate a memory alias — Challenge

Implement aliasDemo() pure: allocate [1], assign it to a second memory variable, change the second variable element to 7, and return the first variable element. Expect 7; explain why.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
