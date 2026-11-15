# Module 18 — Integrated exercises, projects, and learning review

**Prerequisite:** Module 17 · **Tools:** [Remix](https://remix.ethereum.org/) with simulated Remix VM accounts.

## Detailed concept notes

### 1. Specification first

Write user stories, input types, allowed callers, outputs, failure conditions and expected state changes before coding. A vague problem statement often causes avoidable logical bugs.

### 2. From single value to records

The original grade calculator stores one set of marks. A multi-student gradebook instead needs a mapping keyed by an identifier and an existence flag to distinguish a missing record from a score of zero.

### 3. State invariants

Inventory quantity must never become negative; a capacity-limited event must never exceed its maximum; an address must not increase registration count more than once without canceling.

### 4. Permission models

Teacher-only updates may use an owner or role check, but any on-chain private values remain observable. Addresses are wallet identifiers, not verified human identities.

### 5. Incremental development

Start with a minimal contract, compile, run one test, then add one behavior and its tests at a time. Re-deploy after changing source code: existing deployed instances do not magically update.

### 6. Capstone review

The nine original annotated programs remain as reference solutions. Read the requirement from the exercise sheet, implement it independently, test, then compare with the reference. Note where your implementation makes different trade-offs.

### 7. Beyond the course

Continue with standard libraries, automated testing frameworks, advanced Ether safety, token standards, oracle risk and independent review. These tutorial examples must not be treated as audited production code.

## Annotated example

Open [Example.sol](Example.sol) and read the comments. Copy it into Remix, compile with a compatible Solidity compiler, deploy the named contract (or multiple contracts for interactions) using Remix VM, and follow the trace.

**Predict and run:** Call getGrade(2) before saving → (false,0); setGrade(2,0) → getGrade(2) (true,0); attempt setGrade(2,101) and confirm that (true,0) remains.

## Explain in your own words

1. Why specify a contract before implementation?
2. Why does the gradebook track exists?
3. What is the registration capacity invariant?

## Practice and review

[Exercises](EXERCISES.md) · [Quiz](QUIZ.md) · [Explained answers](ANSWERS.md) · [Reference solutions](Solutions.sol)

[← Previous](../17-gas-testing-security/README.md) · [Course index](../../TOPIC-INDEX.md) · [Course home](../../README.md)

> Learning examples only. Not security audited; do not use real Ether.