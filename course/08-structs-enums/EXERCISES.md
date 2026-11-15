# Module 08 — Practice exercises

**Instructions:** Implement each exercise in a new Solidity file. Use Remix VM; make an initial-state test, a normal-input test, a boundary test, and a rejection test when applicable. Do not read the [reference solutions](Solutions.sol) before trying.

### Exercise A — Warm-up
Create an inventory struct with name, quantity, and exists fields, stored by integer ID.

### Exercise B — Application
Add addStock(id,amount) that rejects missing records and zero amounts.

### Exercise C — Challenge
Create an enum for OrderStatus and reject state transitions after Cancelled or Delivered.

## What to submit to yourself
- Your source code with comments identifying each function's purpose.
- Inputs and predicted outputs for at least three cases.
- Actual outputs or revert behavior, compared with your predictions.
- One written explanation of a bug you found and how you fixed it.

[Back to lesson](README.md) · [Quiz](QUIZ.md) · [Reference code](Solutions.sol)