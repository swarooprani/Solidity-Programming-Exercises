# Module 04 — Operators and conditional statements

**Prerequisite:** Module 03 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Arithmetic operators

`+`, `-`, `*`, `/`, `%` operate on integers. Integer division discards the fractional portion. With ordinary checked arithmetic (Solidity 0.8+), overflow and underflow revert.

### 2. Comparison and logic

`<`, `<=`, `>`, `>=`, `==`, `!=` compare values. `&&` means logical AND, `||` logical OR, `!` logical NOT. Solidity supports the conditional operator `condition ? x : y`.

### 3. Precedence

Multiplication occurs before addition, but parentheses make intent explicit. For conditions combining AND and OR, always use parentheses when readers could misunderstand precedence.

### 4. if / else if / else

Conditions are evaluated in order. Once a branch is selected, later branches are skipped. Ordering thresholds matters: test narrow categories before broad ones and verify all boundary values.

### 5. Validation with require

`require` checks preconditions and reverts on false. A reverted transaction discards the attempted state changes. Do not silently accept invalid scores or sold quantities.

### 6. Progressive slabs

In progressive billing, only units within a slab receive that slab's rate. At 250 units: `100*2 + 100*3 + 50*5 = 750`; don't multiply all 250 by the final rate.

### 7. Edge cases

Test on each boundary (for example 99, 100, 101) as well as zero. Be deliberate about whether a maximum is inclusive (`<=`) or exclusive (`<`).

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Check calculate(100)=200; calculate(101)=203; calculate(200)=500; calculate(250)=750.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. What is 7 / 2 for uint256 operands?
2. What is the difference between = and ==?
3. Is 100 in the condition units <= 100?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../03-variables-functions/README.md) · [Next →](../05-loops/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.