# 07. Accounts and access control

**Level:** Intermediate · **Time:** about 20–40 minutes

## What you'll learn
`msg.sender` is the immediate caller of a function. A constructor can save the deploying address as an owner. A modifier can reuse access checks. This is an introduction to permissions, not a complete identity system.

## Understand it
Public state on a blockchain is readable. A function that exposes salary data through a public mapping does not make it confidential. For real-world systems, decide which information belongs on-chain before implementing permissions.

## Try this in Remix
1. Create `07-accounts-access-control.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AdminCounter {
    address public owner;
    uint256 public count;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    function increment() public onlyOwner { count++; }
}
```

**Check:** Deploy from account A; increment once. Switch Remix VM account to B and call increment again. Observe the revert.

## Your turn
Inspect [Employee Salary Management](../../../07_EmployeeSalaryManagement.sol) and [Quiz Score Management](../../../08_SimpleQuizScoreManagement.sol). Explain which functions should and should not be callable by everyone.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../02-working-with-state/06-mappings-and-structs.md) · [All lessons](../../README.md) · [Next →](../03-contract-behavior/08-events-errors.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
