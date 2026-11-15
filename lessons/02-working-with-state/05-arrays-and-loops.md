# 05. Arrays and loops

**Level:** Beginner–intermediate · **Time:** about 20–40 minutes

## What you'll learn
An array stores multiple elements of the same type. Dynamic storage arrays can grow with `push`. Read the element at index 0 to access the first item. Solidity supports `for` and `while` loops.

## Understand it
Every transaction has finite gas. Do not write loops that grow without a limit over user-controlled or unbounded storage arrays. Getter functions that scan large arrays may become costly. Use small inputs for these examples.

## Try this in Remix
1. Create `05-arrays-and-loops.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract NumberList {
    uint256[] private numbers;
    function add(uint256 n) public { numbers.push(n); }
    function get(uint256 index) public view returns (uint256) {
        return numbers[index];
    }
    function length() public view returns (uint256) { return numbers.length; }
}
```

**Check:** Add 5 and 9. Check length = 2, get(0) = 5, and get(1) = 9. What happens when you try get(2)?

## Your turn
Implement sumFirst(uint256 count) that requires count <= numbers.length and loops over at most count elements. Discuss why an unlimited loop is a bad transaction pattern.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../02-working-with-state/04-state-constructors.md) · [All lessons](../../README.md) · [Next →](../02-working-with-state/06-mappings-and-structs.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
