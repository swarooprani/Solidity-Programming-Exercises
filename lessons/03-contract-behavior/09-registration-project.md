# 09. Putting concepts together: event registration

**Level:** Intermediate · **Time:** about 20–40 minutes

## What you'll learn
A useful exercise combines a mapping, a counter, conditions, and `msg.sender`. An event registration contract treats a wallet address as the registration key. This is not proof of a person's real-world identity.

## Understand it
Successful registrations should increase the counter once. The program should reject an already-registered address and reject a registration after the capacity is reached. Always test both a valid and an invalid path.

## Try this in Remix
1. Create `09-registration-project.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract SmallRegistration {
    uint256 public constant CAPACITY = 3;
    uint256 public total;
    mapping(address => bool) public registered;
    function register() public {
        require(!registered[msg.sender], "Already registered");
        require(total < CAPACITY, "Full");
        registered[msg.sender] = true;
        total++;
    }
}
```

**Check:** Register account A once; repeat and observe a revert. Register B and C, then try D and observe the capacity check.

## Your turn
Extend the contract with remainingSeats(). Compare it with the original [Online Event Registration](../../../09_OnlineEventRegistration.sol).

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../03-contract-behavior/08-events-errors.md) · [All lessons](../../README.md) · [Next →](../04-next-steps/10-ether-and-safety.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
