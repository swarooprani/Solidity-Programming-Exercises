# 06. Mappings, structs, and default values

**Level:** Beginner–intermediate · **Time:** about 20–40 minutes

## What you'll learn
A mapping associates a key with a value, such as a student ID with an attendance record. You cannot enumerate a mapping's keys automatically. Unset mapping entries return the value type's default, such as zero or false.

## Understand it
A `struct` groups fields into a record. Track an additional boolean such as `exists` when zero or false is a valid stored value. This avoids confusing 'never entered' with 'entered as zero'.

## Try this in Remix
1. Create `06-mappings-and-structs.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Students {
    struct Record { uint256 score; bool exists; }
    mapping(uint256 => Record) public records;
    function save(uint256 id, uint256 score) public {
        require(score <= 100, "Score too high");
        records[id] = Record(score, true);
    }
}
```

**Check:** Call records(5) before save and after save(5,0). Compare the returned exists flags.

## Your turn
Explain the two mappings in [Attendance Management](../../../06_AttendanceManagement.sol). Extend Students with a view function that refuses to return a score for a missing record.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../02-working-with-state/05-arrays-and-loops.md) · [All lessons](../../README.md) · [Next →](../03-contract-behavior/07-accounts-access-control.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
