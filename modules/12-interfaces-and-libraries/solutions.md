# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 12.1: Define an API

Define IFeeReader with fee() external view returns(uint256). Implement FixedFeeSource returning 7. Deploy and read it.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 12.2: Create a library

Implement internal library LimitMath.cap(n,maximum) returning the smaller value. In a contract LibrarySolutions, expose capped(n,maximum) using the library. (12,10) → 10; (4,10) → 4.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 12.3: Use composition

Create FeeConsumer constructed with a source address and quote() returning its fee. Reject the zero address at construction. Using FixedFeeSource, quote() → 7. Note that a nonzero address is not sufficient proof of a valid API.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The interface fixes the expected signature, and the concrete source satisfies it. This alone does not establish trust in arbitrary sources.

**Exercise 2.** The internal library computes the minimum through a comparison. using syntax passes the receiver as the first argument.

**Exercise 3.** The consumer stores the source address and delegates the read to it. Zero rejection avoids one invalid configuration but cannot validate every nonzero implementation.
