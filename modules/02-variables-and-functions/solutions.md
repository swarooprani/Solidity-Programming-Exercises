# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 02.1: Store a value

Create a private value, set(uint256), and get() view. Check fresh 0, set(8) → get() 8. Explain why private does not hide the value from blockchain observers.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 02.2: Return a tuple

Implement minMax(uint256 a, uint256 b) pure returning the smaller and larger values. Check (9,2) → (2,9), and equal values.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 02.3: Reuse a helper

Implement addDouble(uint256 n) that adds twice n to the stored value using an internal pure _twice helper. With value 8, addDouble(3) gives 14. Overflow reverts.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The setter writes the private state variable and the view getter reads it. Private limits code access, not public-chain visibility.

**Exercise 2.** The comparison selects one ordered pair. Equality takes the first branch but yields the same pair either way.

**Exercise 3.** The state-changing function delegates arithmetic to a pure internal helper and persists only the resulting sum.
