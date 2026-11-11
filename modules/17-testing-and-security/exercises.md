# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 17.1: Write a test matrix — Warm-up

Create tests/security-checklist.md in your practice copy. For PointLedger specify setup, action, expected balances and total for owner issuance, unauthorized issuance, transfer, overspend, zero address and self-transfer. See solutions.md for a worked matrix.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 17.2: Add a supply limit — Application

Implement SecuritySolutions with immutable owner, public total and balances, and owner-only issue(to,amount). Set MAX_SUPPLY=1000 and reject zero recipients. Issuing 1000 succeeds; issuing one more reverts without changing balances or total.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 17.3: Preserve conservation — Challenge

Add transfer(to,amount) with nonzero recipient and sufficient balance. Test A→B, B→A, self-transfer and overspending. Across all participating accounts, the sum of balances must remain equal to total. Include a deterministic generated sequence of at least 20 transfers.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
