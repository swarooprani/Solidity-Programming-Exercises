# Getting started with Solidity and Remix

No local installation, wallet, or real Ether is needed for this course.

## Your first 10 minutes
1. Open [Remix IDE](https://remix.ethereum.org/) in a browser.
2. In **File Explorer**, create a file named `Hello.sol`.
3. Paste this small contract:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract Hello {
    uint256 public number;
    function setNumber(uint256 next) public { number = next; }
}
```

4. In **Solidity Compiler**, choose a compatible **0.8.x** compiler (at least 0.8.20) and click **Compile Hello.sol**.
5. In **Deploy & Run Transactions**, set **Environment** to **Remix VM**, select `Hello`, and click **Deploy**.
6. Expand the deployed contract. Click `number`: it initially returns 0.
7. Enter `42` in `setNumber`, execute it, then click `number` again: now it returns 42.

## Key ideas
- `setNumber` changes stored contract state; the `number` getter reads it.
- Each new deployment is a separate contract with separate state.
- Remix VM gives simulated accounts and funds; do not use a public network for these exercises.
- A successful compile does not guarantee that business logic is correct.

## How to study
Follow the [lesson list](README.md) in order. For each lesson: **read → predict → run → change → test**. Then solve one linked original program on your own before reading its solution.

## Common issues
- **Compiler mismatch:** use a compiler version that satisfies the file's `pragma`.
- **No deploy button:** compile the file, then select the contract in Deploy & Run.
- **Different output than expected:** deploy a fresh instance and repeat the steps.
- **Reverted transaction:** check any `require` conditions and caller account.

[Start Lesson 01](lessons/01-foundations/01-what-is-solidity.md) · [Remix documentation](https://remix-ide.readthedocs.io/)