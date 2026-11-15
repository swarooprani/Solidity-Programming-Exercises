# 04. State, constructors, and getters

**Level:** Beginner–intermediate · **Time:** about 20–40 minutes

## What you'll learn
Contract-level variables are stored persistently. Local variables and function parameters are temporary. A constructor runs once when the contract is deployed and is often used to set initial values.

## Understand it
A state-changing function can update storage. A function declared `view` reads but does not write storage. `public` state variables automatically generate getters. Storage costs gas on a real network: use Remix VM for exercises.

## Try this in Remix
1. Create `04-state-constructors.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Counter {
    uint256 public count;
    constructor(uint256 initialCount) { count = initialCount; }
    function increment() public { count += 1; }
    function reset() public { count = 0; }
}
```

**Check:** Deploy with initialCount = 3. Call count(), increment(), count(), reset(), count() and record 3, 4, 0.

## Your turn
Add decrement() that refuses to decrement zero. Study [Library Book Management](../../../04_LibraryBookManagement.sol) and [Product Inventory Management](../../../05_ProductInventoryManagement.sol).

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../01-foundations/03-conditions-and-validation.md) · [All lessons](../../README.md) · [Next →](../02-working-with-state/05-arrays-and-loops.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
