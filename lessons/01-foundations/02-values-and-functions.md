# 02. Values, functions, and integer arithmetic

**Level:** Beginner · **Time:** about 20–40 minutes

## What you'll learn
`uint256` stores nonnegative whole numbers. `bool` stores true or false. `address` holds an Ethereum address. `string` holds text. Solidity is statically typed, so a function declares its parameter and return types.

## Understand it
Integer division truncates toward zero. A `pure` function is suitable for input-only calculations. Public state variables have generated getter functions. `memory` indicates temporary data for reference types such as strings.

## Try this in Remix
1. Create `02-values-and-functions.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MathPractice {
    function average(uint256 a, uint256 b) public pure returns (uint256) {
        return (a + b) / 2;
    }
}
```

**Check:** Call average(7, 8): the result is 7, not 7.5. Try average(0, 0). For this beginner example use small numbers; think about overflow when adding very large uint256 values.

## Your turn
Implement a pure totalOfThree(a,b,c). Then open [Student Grade Calculator](../../../01_StudentGradeCalculator.sol) and identify where state is written and where it is only read.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../01-foundations/01-what-is-solidity.md) · [All lessons](../../README.md) · [Next →](../01-foundations/03-conditions-and-validation.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
