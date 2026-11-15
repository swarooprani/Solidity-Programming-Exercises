# Module 11 — Errors, reverts and events

**Prerequisites:** earlier modules in the [ordered index](../../TOPIC-INDEX.md). **Environment:** Remix VM; no real Ether.

## Detailed concept notes

### 1. require

Use require(condition, reason) for external input validation and preconditions, such as insufficient funds or disallowed callers. A false condition reverts the transaction.

### 2. revert and custom errors

Custom errors provide typed failure information. For example, declare error OutOfStock(uint256 requested); and revert OutOfStock(quantity) when inventory cannot cover a sale. This can save gas versus long revert messages.

### 3. assert

Use assert to express internal invariants that should never fail if the contract is implemented correctly. Do not use it as the primary validation mechanism for ordinary user errors.

### 4. Atomic rollback

On revert, all state modifications in that call tree revert, and its emitted logs are also discarded. Gas spent processing can still be consumed.

### 5. Events

Declare an event to describe successful changes and emit it after the state transition. An indexed event field helps off-chain tools filter logs. Logs are useful for user interfaces, but contracts cannot freely query historical logs as state.

### 6. Testing errors

Test boundaries and deliberate failures, and read storage after every revert to confirm rollback. Do not mistake the mere presence of a transaction in Remix history for a successful state change.

## Worked program and execution trace

Read the fully commented [Example.sol](Example.sol). Paste into [Remix](https://remix.ethereum.org/), compile with a compatible 0.8.x Solidity compiler, select the appropriate contract and deploy under **Remix VM**. If a file declares multiple contracts, deploy each required one separately.

**Predict → execute → observe:** Call sell(3), inspect StockSold and stock=7. Call sell(8), observe the custom error, then verify stock is still 7.

## Knowledge check

1. Does state update survive a revert?
2. When is assert intended to be used?
3. What are indexed event fields useful for?

## Study resources

[Hands-on exercises](EXERCISES.md) · [Independent quiz](QUIZ.md) · [Answers with explanations](ANSWERS.md) · [Reference implementation](Solutions.sol)

[Course index](../../TOPIC-INDEX.md) · [Previous](../10-access-control/README.md) · [Next](../12-inheritance/README.md)

> Educational examples are not audited.