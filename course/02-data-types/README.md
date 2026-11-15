# Module 02 — Data types and conversions

**Prerequisite:** Module 01 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Unsigned and signed integers

`uint8`, `uint16` … `uint256` store unsigned whole numbers; `int8` … `int256` can store negative numbers. `uint` is an alias of `uint256`. An 8-bit unsigned integer ranges from 0 to 255. Solidity 0.8+ normally checks overflow and underflow, reverting instead of silently wrapping.

### 2. Booleans and comparisons

`bool` holds `true` or `false`. Comparisons produce booleans; arithmetic is for integer types. Use `==` to compare values and `=` to assign values.

### 3. Addresses

`address` represents an account or contract address; `address payable` additionally supports Ether transfers. Addresses are not verified human identities and should not be treated as secrets.

### 4. Strings and bytes

`string` is UTF-8 text; `bytes` is a dynamic byte sequence; `bytes32` is exactly 32 bytes. A string's byte length may differ from the number of visible Unicode characters.

### 5. Literals and units

Write `100`, `true`, and `"hello"` as literals. `1 ether` and `1 gwei` are unit suffixes for wei-based amounts, not interchangeable with ordinary integer values.

### 6. Explicit conversions

Converting from a wider integer to a narrower integer can discard high bits. Avoid unchecked narrowing of untrusted inputs; first check range, then cast. Casting negative signed values into unsigned types also needs care.

### 7. Defaults and ranges

New unsigned storage values start at 0, booleans at false, and addresses at the zero address. A default zero does not always mean a record was deliberately created.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Call maxSmall() → 255, validAge(150) → true, validAge(151) → false, safelyNarrow(255) → 255; safelyNarrow(256) reverts.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. What range does uint8 represent?
2. What does the default bool mapping entry return?
3. Does uint256 represent -1?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../01-contract-basics/README.md) · [Next →](../03-variables-functions/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.