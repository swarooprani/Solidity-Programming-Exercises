# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 10.1: Custom validation error — Warm-up

Implement set(n), public value and error OutOfRange(uint256). Accept 0..10; 11 reverts. A failed set must preserve the previous value.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 10.2: Emit a change — Application

Add event Changed(address indexed caller,uint256 value) to successful set calls. Inspect the receipt and decode caller and value. Failed calls must leave no Changed log.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 10.3: Prove rollback — Challenge

Implement attemptThenFail(n), assigning value=n, emitting Changed, then reverting with DeliberateFailure(). Starting at 5, any call leaves value at 5. Explain why the assignment and log do not survive.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
