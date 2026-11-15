# Module 00 — Introduction, Ethereum and Remix

**Prerequisite:** None; begin with Remix setup · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. What is a smart contract?

A smart contract is code deployed to an Ethereum-compatible chain. An Ethereum transaction can deploy it or call it. Every successful state-changing transaction changes the shared state according to deterministic rules. A Solidity source file is *not* itself a deployed contract; the compiler produces bytecode and an ABI describing how to call it.

### 2. Accounts and transactions

Externally owned accounts are controlled by private keys; contract accounts execute deployed code. `msg.sender` identifies the immediate caller. A state-changing call generally needs a transaction and costs gas on public networks. A simulated call to a `view` or `pure` function does not change state.

### 3. Remix workflow

In Remix: create `.sol` file → choose compatible Solidity compiler → compile → select contract → choose **Remix VM** → deploy → expand deployed instance → invoke functions. Remix VM provides simulated accounts and Ether; it is intended for local experimentation.

### 4. Deployment and isolation

Separate deployments of the same compiled bytecode have different addresses and independent storage. A contract does not run on its own every second; a transaction or another contract call must initiate code execution. Deployed bytecode is not updated merely because you edit the source file.

### 5. Safety vocabulary

A wallet is unnecessary for Remix VM. Never send real funds to tutorial contracts. Public-chain transactions and storage are visible to others, even if functions have access restrictions.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Deploy IntroCounter, read count() (0), call set(7), read count() (7), deploy a second instance and confirm its count is still 0.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. Does compiling source code deploy a contract?
2. What does Remix VM provide?
3. Does editing a source file update an already deployed contract?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [Setup](../../GETTING-STARTED.md) · [Next →](../01-contract-basics/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.