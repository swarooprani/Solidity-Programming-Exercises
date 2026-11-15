# Module 06 — Arrays, strings, and bytes

**Prerequisite:** Module 05 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Fixed and dynamic arrays

`uint256[3]` has exactly three positions, while `uint256[]` is dynamic. Arrays are zero-indexed. The `.length` property reports the number of items, and accessing a non-existent index reverts.

### 2. Storage arrays

Dynamic storage arrays can grow with `.push(value)` and shrink with `.pop()`. Changing a storage array persists. Exposing a public array generates index-based accessors, not a magical unrestricted getter for the whole array.

### 3. Memory arrays

Memory arrays are temporary. A new array may be allocated with `new uint256[](size)` and does not support `.push()`. Copying memory data to storage has a different cost and lifetime.

### 4. Strings

Solidity stores strings as UTF-8 data. Avoid treating `bytes(myString).length` as a count of human-perceived letters: a Unicode character may occupy multiple bytes.

### 5. bytes and bytes32

`bytes` is dynamic byte content; `bytes32` is a fixed-size 32-byte value often used for hashes. Strings are not directly indexable like a character array; converting to bytes accesses raw bytes rather than Unicode characters.

### 6. Performance and limits

Returning or processing huge arrays increases cost. For on-chain state, prefer bounded operations and retrieve ranges off-chain or with paginated getters.

### 7. Removing items

`.pop()` removes the last element. Removing an element from the middle while preserving order normally requires shifting other elements, which can cost gas.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** add(8), add(13), length() → 2, at(0) → 8, removeLast(), length() → 1; at(1) now reverts.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. What is the first array index?
2. Can you push onto a fixed-length array?
3. What does `.pop()` do on a dynamic storage array?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../05-loops/README.md) · [Next →](../07-mappings/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.