# 01. Your first smart contract

**Level:** Beginner · **Time:** about 20–40 minutes

## What you'll learn
Solidity is a language for programs called smart contracts that run on Ethereum-compatible blockchains. Source code is compiled before deployment. Deployment creates a contract instance with its own persistent state; editing the file does not change a deployed instance.

## Understand it
`pragma solidity ^0.8.20` declares compatible compiler versions. `contract` declares the program. A function marked `pure` performs calculations without accessing contract state. A `view` function may read state but does not change it. A state-changing call from a user is a transaction in the usual Remix VM workflow.

## Try this in Remix
1. Create `01-what-is-solidity.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract HelloSolidity {
    function greet() public pure returns (string memory) {
        return "Hello, Solidity!";
    }
}
```

**Check:** Deploy HelloSolidity and call greet. Explain why this example does not need a wallet or real Ether in Remix VM.

## Your turn
Change the returned greeting. Add a second pure function that returns the number 2026. What changes when you deploy a second copy?

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Setup](../../GETTING-STARTED.md) · [All lessons](../../README.md) · [Next →](../01-foundations/02-values-and-functions.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
