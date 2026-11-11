# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 12.1: Define an API — Warm-up

Define IFeeReader with fee() external view returns(uint256). Implement FixedFeeSource returning 7. Deploy and read it.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 12.2: Create a library — Application

Implement internal library LimitMath.cap(n,maximum) returning the smaller value. In a contract LibrarySolutions, expose capped(n,maximum) using the library. (12,10) → 10; (4,10) → 4.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 12.3: Use composition — Challenge

Create FeeConsumer constructed with a source address and quote() returning its fee. Reject the zero address at construction. Using FixedFeeSource, quote() → 7. Note that a nonzero address is not sufficient proof of a valid API.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
