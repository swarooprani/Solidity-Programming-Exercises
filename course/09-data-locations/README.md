# Module 09 — Storage, memory, and calldata

**Prerequisite:** Module 08 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Reference types need locations

Arrays, structs and strings have different copy/reference behavior depending on data location. State variables are in persistent `storage`. For parameters and locals, Solidity often requires `memory`, `calldata`, or `storage` explicitly.

### 2. storage reference

A local `T storage alias = stateVariable;` aliases the original data, rather than copying it. Changing `alias` changes persistent state, even when the variable looks local.

### 3. memory copy

`memory` is temporary for the current call. Copying storage data to memory creates an independent copy; edits to that memory copy do not update storage unless explicitly assigned back.

### 4. calldata

External function parameters can use `calldata` for input reference types. Calldata is read-only, so you can't change its elements in place. It's often cheaper than copying input arrays into memory unnecessarily.

### 5. Choosing wisely

Use `calldata` for external read-only reference-type inputs, `memory` for temporary working copies, and `storage` when you intend to read or modify persistent data. Optimizations should follow correctness.

### 6. Value types

Integers and booleans have value semantics and do not need explicit memory/storage locations in function parameters.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Deploy with empty array; add(4); original(0)=4; changedCopy()=99 but original(0) remains 4; changeStorage(7) updates original(0)=7.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. Does editing a memory copy update storage automatically?
2. Can calldata input arrays be modified in place?
3. What does a local storage reference point to?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../08-structs-enums/README.md) · [Next →](../10-access-control/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.