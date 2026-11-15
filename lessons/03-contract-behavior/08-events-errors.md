# 08. Events, errors, and transactions

**Level:** Intermediate · **Time:** about 20–40 minutes

## What you'll learn
Events are logs that applications can watch; they are not the contract's permanent data storage. A transaction can succeed or revert. Use `require` for straightforward preconditions, and events to record meaningful successful changes.

## Understand it
Custom errors can be cheaper than long revert strings. When a call reverts, its state changes and emitted logs are rolled back. The caller must inspect the transaction result; sending a transaction is not the same as guaranteed success.

## Try this in Remix
1. Create `08-events-errors.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract CheckedCounter {
    error TooLarge();
    event Changed(uint256 newValue);
    uint256 public value;
    function set(uint256 next) public {
        if (next > 100) revert TooLarge();
        value = next;
        emit Changed(next);
    }
}
```

**Check:** Call set(25), inspect the log, then call set(101). Confirm that the stored value is still 25.

## Your turn
Add a second event for reset(). Explain why a user interface must check whether the transaction succeeded.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../03-contract-behavior/07-accounts-access-control.md) · [All lessons](../../README.md) · [Next →](../03-contract-behavior/09-registration-project.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
