# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 17.1: Write a test matrix

Create tests/security-checklist.md in your practice copy. For PointLedger specify setup, action, expected balances and total for owner issuance, unauthorized issuance, transfer, overspend, zero address and self-transfer. See solutions.md for a worked matrix.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 17.2: Add a supply limit

Implement SecuritySolutions with immutable owner, public total and balances, and owner-only issue(to,amount). Set MAX_SUPPLY=1000 and reject zero recipients. Issuing 1000 succeeds; issuing one more reverts without changing balances or total.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 17.3: Preserve conservation

Add transfer(to,amount) with nonzero recipient and sufficient balance. Test A→B, B→A, self-transfer and overspending. Across all participating accounts, the sum of balances must remain equal to total. Include a deterministic generated sequence of at least 20 transfers.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## Worked test matrix for PointLedger

| Setup/action | Expected A | Expected B | Expected total |
|---|---:|---:|---:|
| Owner issues A=10, B=5 | 10 | 5 | 15 |
| B tries to issue 1 to B | 10 | 5 | 15; revert |
| A transfers 3 to B | 7 | 8 | 15 |
| A tries to transfer 8 to B | 7 | 8 | 15; revert |
| A transfers 2 to A | 7 | 8 | 15 |
| A transfers 1 to zero address | 7 | 8 | 15; revert |

Run these sequentially on the same instance; deploy a fresh instance for an independent scenario. The automated suite also checks generated sequences on SecuritySolutions.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The matrix tests both successful state changes and prohibited actions, including the subtle self-transfer case.

**Exercise 2.** Subtracting total from the cap is safe because total never exceeds the cap. The requested amount is checked before adding it.

**Exercise 3.** Transfers subtract and add the same amount. A self-transfer returns to the original balance; the generated sequence checks conservation after every successful step.
