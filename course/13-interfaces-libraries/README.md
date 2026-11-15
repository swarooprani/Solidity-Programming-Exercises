# Module 13 — Interfaces, libraries and composition

**Prerequisites:** earlier modules in the [ordered index](../../TOPIC-INDEX.md). **Environment:** Remix VM; no real Ether.

## Detailed concept notes

### 1. Interfaces

An interface declares callable function signatures but not their implementations. Use an interface to interact with a deployed contract through a known ABI, without having to inherit from it.

### 2. Typed external calls

An interface cast can call a known function on another address. That target may still revert, have unexpected behavior, or be malicious; an interface is not a trust guarantee.

### 3. Libraries

Libraries group reusable functions. Internal library functions can be used as helpers without deploying an independent library in simple cases. A using-for declaration enables method syntax on compatible types.

### 4. Composition

With composition, one contract keeps a reference to another and calls it. This is an alternative to inheritance, but introduces an external call boundary.

### 5. ABI matching

Parameter and return types must match the target function. Incompatible targets and failed calls need tests.

### 6. Security

Validate target addresses and do not assume an arbitrary caller-supplied address behaves safely. Libraries reduce duplication but do not replace review.

## Worked program and execution trace

Read the fully commented [Example.sol](Example.sol). Paste into [Remix](https://remix.ethereum.org/), compile with a compatible 0.8.x Solidity compiler, select the appropriate contract and deploy under **Remix VM**. If a file declares multiple contracts, deploy each required one separately.

**Predict → execute → observe:** Deploy CounterTarget and CounterReader. Copy the target address into read() and expect 7. Call twice(11) → 22.

## Knowledge check

1. What is an interface?
2. What is a library useful for?
3. What does using-for enable?

## Study resources

[Hands-on exercises](EXERCISES.md) · [Independent quiz](QUIZ.md) · [Answers with explanations](ANSWERS.md) · [Reference implementation](Solutions.sol)

[Course index](../../TOPIC-INDEX.md) · [Previous](../12-inheritance/README.md) · [Next](../14-ether-payable/README.md)

> Educational examples are not audited.