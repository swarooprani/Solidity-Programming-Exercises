# Module 03 — Variables and functions

**Prerequisite:** Module 02 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. State versus local variables

State variables are declared directly inside contracts, persist between transactions, and generally cost gas to update. Local variables are declared inside functions and last only for that invocation. Function parameters are inputs; Solidity requires their types.

### 2. Scope

Identifiers defined in a block are available only within their scope. A local variable can hide a state variable with the same name, which is confusing; prefer distinct names. Global context values such as `msg.sender` and `block.timestamp` have special meanings.

### 3. constant and immutable

A `constant` value is fixed at compile time. An `immutable` variable can be assigned at declaration or within the constructor and then cannot change. Both differ from ordinary mutable storage variables.

### 4. Visibility

`external` functions are intended for outside calls. `public` may be called both internally and externally. `internal` is callable within the contract and derived contracts, while `private` is only callable internally within the declaring contract. `private` never means secret on-chain data.

### 5. Function mutability

`pure` does not read or write contract state; `view` reads but does not modify state; `payable` allows a call to attach Ether. Ordinary unmarked functions may update state.

### 6. Return values and parameter locations

Functions may return multiple values using tuples. Reference types such as strings, arrays, and structs typically require a data location (`memory` or `calldata`) in parameters.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** Deploy with initialCount=5; read owner() and count()=5; add(3) → count()=8; double(4) → 8 without changing count.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. Where does a state variable live?
2. Can immutable be reassigned in a normal function?
3. What is the difference between pure and view?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../02-data-types/README.md) · [Next →](../04-operators-conditionals/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.