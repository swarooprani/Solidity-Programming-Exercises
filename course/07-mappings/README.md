# Module 07 — Mappings and nested mappings

**Prerequisite:** Module 06 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Key-value storage

A mapping associates a key with a value: `mapping(uint256 => uint256) balances;` maps an integer ID to an integer amount. A key lookup runs directly without searching a list.

### 2. Default values

Unset entries read as their value type's default: 0 for uint256, false for bool, zero address for address. This means `scores[id] == 0` cannot distinguish an unentered score from a recorded zero.

### 3. Tracking existence

Use a second mapping such as `mapping(uint256 => bool) recorded` or a struct containing `exists` to tell the difference between missing and valid zero values.

### 4. Nested mappings

A nested mapping can index two keys, for example `mapping(address => mapping(address => bool)) approvals;`. These are not automatically enumerable; mappings do not provide a `.length` or key list.

### 5. Storage and visibility

Mappings are state-only structures. Public mappings have generated getters, so do not store confidential information assuming it is inaccessible.

### 6. Update and delete

Assigning a value updates a mapping entry. `delete scores[id]` resets the entry to its default, not to a concept of 'absent'; if tracking presence, reset its flag too.

### 7. Identity versus keys

A numeric student ID is merely an input; `msg.sender` is a caller address, not evidence of a human's verified identity.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** lookup(9) initially returns (false,0); save(9,0) then lookup(9) returns (true,0); erase(9) restores (false,0).

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. What is the default value of an unset mapping(uint256 => bool) entry?
2. Can you obtain all mapping keys from a built-in method?
3. Why add an `exists` field?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../06-arrays-strings-bytes/README.md) · [Next →](../08-structs-enums/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.