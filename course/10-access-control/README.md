# Module 10 — Constructors and access control

**Prerequisites:** earlier modules in the [ordered index](../../TOPIC-INDEX.md). **Environment:** Remix VM; no real Ether.

## Detailed concept notes

### 1. Constructors

A constructor runs once during deployment and can initialize variables. Save the deploying address with msg.sender. An immutable owner address may be assigned during construction and is then fixed. Each deployment sets its own owner.

### 2. The caller

msg.sender is the immediate caller, not necessarily the original human sending a transaction; when one contract calls another, the called contract sees the first contract as msg.sender.

### 3. Modifiers

A modifier is reusable function wrapping logic. A modifier called onlyOwner normally checks msg.sender and then uses the underscore placeholder to execute the protected function body. An unauthorized call reverts and leaves state unchanged.

### 4. Function visibility

external functions are callable externally; public functions can be called internally and externally; internal is visible to derived contracts; private is limited to the declaring contract. None of these make on-chain state confidential.

### 5. Ownership lifecycle

For ownership changes, validate the replacement address, consider two-step acceptance, and prevent accidental lockout. Complex role management is best built using established libraries such as OpenZeppelin.

### 6. Risks

A public setter on an admin-controlled system lets any wallet change configuration. A private state variable does not conceal secrets: public-chain storage is observable. Role checks must be tested with different accounts.

## Worked program and execution trace

Read the fully commented [Example.sol](Example.sol). Paste into [Remix](https://remix.ethereum.org/), compile with a compatible 0.8.x Solidity compiler, select the appropriate contract and deploy under **Remix VM**. If a file declares multiple contracts, deploy each required one separately.

**Predict → execute → observe:** Deploy from Remix VM account A. Call setLimit(20). Switch to account B and attempt setLimit(30), which must revert. Read limit() and verify it remains 20.

## Knowledge check

1. When does a constructor run?
2. What does msg.sender identify?
3. What does the underscore in a modifier do?

## Study resources

[Hands-on exercises](EXERCISES.md) · [Independent quiz](QUIZ.md) · [Answers with explanations](ANSWERS.md) · [Reference implementation](Solutions.sol)

[Course index](../../TOPIC-INDEX.md) · [Previous](../09-data-locations/README.md) · [Next](../11-errors-events/README.md)

> Educational examples are not audited.