# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 13.1: Track deposits — Warm-up

Implement deposit() payable and public balanceOf mapping. Reject zero value. Deposits of 3 and 7 wei by A produce balanceOf(A)=10; B stays 0.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 13.2: Withdraw safely — Application

Add withdraw(amount). Require 0 < amount <= caller balance; reduce balance before transferring to msg.sender with call; check success and use a nonReentrant modifier. A withdraws 4 from 10 and remains at 6.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 13.3: Emit accounting events — Challenge

Emit Deposited(account,amount) and Withdrawn(account,amount). Add liabilities, increasing on deposits and decreasing on successful withdrawals. If a receiver rejects payment, all accounting must remain unchanged.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
