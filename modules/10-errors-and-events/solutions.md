# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 10.1: Custom validation error

Implement set(n), public value and error OutOfRange(uint256). Accept 0..10; 11 reverts. A failed set must preserve the previous value.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 10.2: Emit a change

Add event Changed(address indexed caller,uint256 value) to successful set calls. Inspect the receipt and decode caller and value. Failed calls must leave no Changed log.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 10.3: Prove rollback

Implement attemptThenFail(n), assigning value=n, emitting Changed, then reverting with DeliberateFailure(). Starting at 5, any call leaves value at 5. Explain why the assignment and log do not survive.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The custom error carries the rejected value. Validation occurs before a normal assignment.

**Exercise 2.** The event is emitted only along a successful path. The receipt contains the caller topic and encoded value.

**Exercise 3.** Reversion discards the assignment and log from that execution. The runtime suite forces a mined failure and checks its empty logs.
