# Module 08 — Structs, enums, and records

**Prerequisite:** Module 07 · **Practice:** use simulated **Remix VM**, not real Ether

## Learning goals
By the end of this module, you should be able to explain the concepts below, predict example output, and solve the practice tasks without opening the answer key.

## Detailed concept notes

### 1. Why structs?

A struct combines related fields into one record. Example: `struct Student { uint256 score; bool exists; }`. Structs can be stored in mappings or arrays and help avoid parallel arrays that go out of sync.

### 2. Constructing a struct

Create records using positional `Student(90, true)` or named `Student({score:90, exists:true})` syntax. Named fields make longer records easier to review.

### 3. Enums

An enum is a finite set of named alternatives, such as `enum Status { Pending, Approved, Rejected }`. Stored enum variables default to the first member (numeric zero).

### 4. State machines

A state machine restricts which transitions are allowed. For example, a pending request may become Approved or Rejected, but should not switch arbitrarily after completion.

### 5. Structs and mappings

A mapping can store a struct: `mapping(uint256 => Student) students`. An unset struct appears with default field values; include a presence flag when an uninitialized record matters.

### 6. Access to records

A `public` mapping of structs has a generated getter for accessible fields, but not an automatic interface to list all keys. Use explicit functions when you want custom validation or outputs.

### 7. Practical trade-offs

Struct records improve readability but do not enforce authorization automatically. Carefully decide who can update each field; add appropriate checks at later access-control lessons.

## Syntax and runnable worked example

Read the annotated code in [Example.sol](Example.sol). It is a standalone file: paste it into [Remix](https://remix.ethereum.org/), choose a compiler satisfying the pragma, and compile. Select the contract and deploy to Remix VM.

**Step-by-step trace:** get(1) before create returns (false,0,Pending); create(1,85), then get(1) reports true,85,Pending; decide(1,true) changes status to Approved; deciding again reverts.

Pay attention to the constructor arguments if present, account selection, whether you are calling a read-only getter or a state-changing transaction, and any deliberate reverts. Make a fresh deployment if you need a clean starting state.

## Common mistakes to avoid
- Confusing a successful compile with verified correct behavior.
- Skipping input boundaries or assuming an unsuccessful transaction updates storage.
- Reading the reference solution before independently attempting practice.

## Questions to think through
1. What is a struct for?
2. What does an enum default to?
3. Can an enum directly enforce valid transitions?

## Practice and assessment
- [Three exercises](EXERCISES.md) — warm-up, application, challenge.
- [Five-question quiz](QUIZ.md) — try without peeking.
- [Explained answers](ANSWERS.md) and [reference implementation](Solutions.sol) — review afterwards.

[Course index](../../TOPIC-INDEX.md) · [← Previous](../07-mappings/README.md) · [Next →](../09-data-locations/README.md)

> Educational code only. Public-chain behavior, security, and gas limits matter; do not use real assets.