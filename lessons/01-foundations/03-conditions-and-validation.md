# 03. Conditions and input validation

**Level:** Beginner · **Time:** about 20–40 minutes

## What you'll learn
`if`, `else if`, and `else` select branches. Comparisons use operators such as `<`, `<=`, `==`, and `>=`. Since `uint256` cannot represent negative values, checking for a negative `uint256` input is unnecessary.

## Understand it
`require(condition, message)` rejects a call if the condition is false. Reverted transactions do not retain the attempted state updates. Decide whether a rule belongs in a `pure` calculator or a state-changing function.

## Try this in Remix
1. Create `03-conditions-and-validation.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract TicketPrice {
    function price(uint256 age) public pure returns (uint256) {
        if (age < 12) return 50;
        if (age >= 60) return 70;
        return 100;
    }
}
```

**Check:** Test ages 11, 12, 59, and 60. Predict each result before executing.

## Your turn
Add a discount for age 12–17. Compare with [Age Category Checker](../../../03_AgeCategoryChecker.sol) and [Electricity Bill Calculator](../../../02_ElectricityBillCalculator.sol), especially the slab boundaries.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../01-foundations/02-values-and-functions.md) · [All lessons](../../README.md) · [Next →](../02-working-with-state/04-state-constructors.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
