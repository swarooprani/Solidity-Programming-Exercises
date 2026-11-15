# Module 17 — Gas, testing, and security fundamentals

**Prerequisite:** Module 16 · **Tools:** [Remix](https://remix.ethereum.org/) with simulated Remix VM accounts.

## Detailed concept notes

### 1. Gas model

EVM computation, persistent storage writes, logs and calldata cost gas. State-changing calls on public networks consume real value. Optimizations must preserve correctness and not make code unnecessarily opaque.

### 2. Unbounded operations

Loops over persistent arrays that can grow indefinitely may become impossible to execute within transaction gas limits. Add a maximum batch size and expose pagination for large datasets.

### 3. Unit and boundary tests

A good test checks initial state, a normal path, zero/minimum/maximum inputs, invalid or reverted inputs, and state unchanged after failure. Compilation alone does not test requirements.

### 4. Integration tests

When two contracts interact, test correct targets, mismatched targets, and forced reverts. When access matters, use separate caller accounts to verify owner-only behavior.

### 5. Invariants

An invariant holds across all valid actions. Examples: inventory cannot become negative, registration count stays at most capacity, and a failed transaction leaves prior state unchanged. Test sequences of actions, not merely single calls.

### 6. Security review

Consider access control, reentrancy, unpredictable external calls, denial of service, integer conversions, rounding and public data privacy. No tutorial checklist replaces an independent audit or production-quality testing.

### 7. Tools and learning approach

Beginners can start with manual Remix VM checks, then graduate to automated local test frameworks. Don't infer security from a successful compile or from a few green tests.

## Annotated example

Open [Example.sol](Example.sol) and read the comments. Copy it into Remix, compile with a compatible Solidity compiler, deploy the named contract (or multiple contracts for interactions) using Remix VM, and follow the trace.

**Predict and run:** Deploy, call process(3), observe 3; process(25), observe 28; process(26) reverts, total remains 28.

## Explain in your own words

1. Why is a loop over an unbounded array a problem?
2. Does compilation prove correctness?
3. What is an invariant?

## Practice and review

[Exercises](EXERCISES.md) · [Quiz](QUIZ.md) · [Explained answers](ANSWERS.md) · [Reference solutions](Solutions.sol)

[← Previous](../16-abi-hashing/README.md) · [Course index](../../TOPIC-INDEX.md) · [Next →](../18-projects/README.md)

> Learning examples only. Not security audited; do not use real Ether.