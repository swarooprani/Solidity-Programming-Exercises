# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 00.1: Store a score

Create `setScore(uint256)` and a public `score` variable. Accept any uint256. On a fresh deployment score is 0; after setScore(7), it is 7. Replacing it with 0 must work.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 00.2: Count visits

Add `visit()` and public `visits`. Each successful call increments visits once. Fresh → 0; two calls → 2. This counts calls, not unique people.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 00.3: Reset the counter

Add `resetVisits()`. After two visits and a reset, visits is 0 and score is unchanged. Let anyone call it for this exercise; discuss why a real application might restrict it.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** setScore writes a persistent state variable. A later getter call reads that stored value, including an explicitly stored zero.

**Exercise 2.** Each visit adds one to state, so the count survives calls. It counts invocations rather than unique addresses.

**Exercise 3.** resetVisits assigns zero only to visits; score is a different storage variable and is preserved.
