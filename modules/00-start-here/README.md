# 00. Blockchain, Solidity and your first contract

Prerequisite: [Getting started](../../docs/GETTING-STARTED.md)

## Learning outcomes

- Distinguish source code, deployed contract and contract state.
- Compile, deploy and call a contract in Remix.
- Predict how separate deployments behave.

## Explanation

A blockchain is a shared record of transactions and state. Ethereum executes smart contracts using the Ethereum Virtual Machine (EVM). Solidity is a statically typed language that compiles into EVM bytecode. Writing a file does not deploy it: compilation produces artifacts, and deployment creates a contract instance at an address.

An externally owned account is controlled by a key. A contract account runs code when called. A transaction can deploy a contract or request a state change. A read can be simulated without publishing a transaction. Contracts do not run continuously: someone must call a function. A deadline alone does not trigger an action.

In the example, `number` is persistent state. `set` changes it; its new value survives later calls. `public` creates a getter for the variable. Each deployment has its own state. The license line identifies the source license; the pragma constrains compatible compiler versions. It does not install or select a compiler.

Start with Remix VM, which provides a temporary practice blockchain and simulated accounts. No wallet setup or real ETH is needed. Read the transaction result and state after every call. A successful compilation checks syntax and types, not whether your business rules are correct.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Deploy `FirstStore` with no arguments. Read `number()` → `0`. Send `set(42)`, wait for success, then read → `42`. Deploy a second instance; its number is still `0`. Calling the getter does not change either instance.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/introduction-to-smart-contracts.html)
- [Official reference 2](https://remix-ide.readthedocs.io/en/latest/run.html)

[Getting started](../../docs/GETTING-STARTED.md) | [Course home](../../README.md) | [Next module](../01-types-and-operators/README.md)
