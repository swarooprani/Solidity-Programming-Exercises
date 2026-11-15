# Module 12 — Inheritance and overriding

**Prerequisites:** earlier modules in the [ordered index](../../TOPIC-INDEX.md). **Environment:** Remix VM; no real Ether.

## Detailed concept notes

### 1. Inheritance relationship

A derived contract uses the is keyword and may inherit state and callable functions from a base contract. Inheritance is useful for specialized implementations but can obscure behavior in deep hierarchies.

### 2. virtual and override

Mark a base function virtual if derived contracts may replace it. Derived implementations declare override. Function signatures, mutability, and visibility must obey Solidity override rules.

### 3. Abstract contracts

An abstract contract may declare functions without bodies. It cannot be deployed as a complete concrete instance. Derived contracts must implement any remaining abstract functions.

### 4. super

A super call reaches the next applicable implementation according to Solidity inheritance linearization, important when several bases are involved. It is not necessarily just the first parent named.

### 5. Constructors

Base constructor arguments are supplied during derived deployment. Do not confuse constructor chaining with ordinary function calls after deployment.

### 6. Design caution

Multiple inheritance and changing overrides can alter important authorization or accounting logic. Prefer composition where hierarchy becomes hard to understand.

## Worked program and execution trace

Read the fully commented [Example.sol](Example.sol). Paste into [Remix](https://remix.ethereum.org/), compile with a compatible 0.8.x Solidity compiler, select the appropriate contract and deploy under **Remix VM**. If a file declares multiple contracts, deploy each required one separately.

**Predict → execute → observe:** Deploy Square(5). Call area() → 25 and kind() → Square. Try selecting abstract Shape for deployment; an abstract contract is not deployable by itself.

## Knowledge check

1. What keyword introduces inheritance?
2. Why use virtual?
3. What does override declare?

## Study resources

[Hands-on exercises](EXERCISES.md) · [Independent quiz](QUIZ.md) · [Answers with explanations](ANSWERS.md) · [Reference implementation](Solutions.sol)

[Course index](../../TOPIC-INDEX.md) · [Previous](../11-errors-events/README.md) · [Next](../13-interfaces-libraries/README.md)

> Educational examples are not audited.