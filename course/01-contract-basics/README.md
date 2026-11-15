# Module 01 — Smart-contract structure

**Prerequisite:** Module 00 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Header directives

`// SPDX-License-Identifier: MIT` declares a source license. `pragma solidity ^0.8.20;` allows compatible 0.8.x compiler versions from 0.8.20 upward, but not 0.9.0. It does not download a compiler by itself.

### 2. Contract declaration

`contract Name { ... }` is a container for state variables, functions, events, modifiers and other declarations. Solidity is case-sensitive. A source file may contain multiple contracts, so select the intended one in Remix before deploying.

### 3. Function anatomy

A function declaration includes a name, typed parameters, visibility (`public`, `external`, `internal`, `private`), optional mutability (`pure`, `view`, `payable`), and return types. Named parameters clarify purpose; the `returns (...)` clause specifies outputs.

### 4. Automatic getters

Declaring `uint256 public score;` creates a getter named `score()`. It does **not** create a setter. A custom setter changes storage and can include validation.

### 5. Compilation and deployment

Syntax errors prevent compilation. Successful compilation does not check that the *business requirements* are correct. Select a compiler satisfying pragma, inspect warnings, then deploy to Remix VM.

### 6. What happens to a call?

A `pure` function computes from inputs; a `view` function reads state; a regular state-changing function can write storage. On Remix VM you can see transactions and their outputs in the console.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Deploy ContractParts, call doubled(6) → 12, call lastValue() → 0, call save(9), then lastValue() → 9.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. What does the pragma specify?
2. Does `public` on a state variable add a setter?
3. Which function can read state but not modify it?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../00-introduction/README.md) · [Next →](../02-data-types/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.