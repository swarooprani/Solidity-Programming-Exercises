# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 00.1: Store a score — Warm-up

Create `setScore(uint256)` and a public `score` variable. Accept any uint256. On a fresh deployment score is 0; after setScore(7), it is 7. Replacing it with 0 must work.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 00.2: Count visits — Application

Add `visit()` and public `visits`. Each successful call increments visits once. Fresh → 0; two calls → 2. This counts calls, not unique people.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 00.3: Reset the counter — Challenge

Add `resetVisits()`. After two visits and a reset, visits is 0 and score is unchanged. Let anyone call it for this exercise; discuss why a real application might restrict it.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
