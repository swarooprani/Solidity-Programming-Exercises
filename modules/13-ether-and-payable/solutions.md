# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 13.1: Track deposits

Implement deposit() payable and public balanceOf mapping. Reject zero value. Deposits of 3 and 7 wei by A produce balanceOf(A)=10; B stays 0.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 13.2: Withdraw safely

Add withdraw(amount). Require 0 < amount <= caller balance; reduce balance before transferring to msg.sender with call; check success and use a nonReentrant modifier. A withdraws 4 from 10 and remains at 6.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 13.3: Emit accounting events

Emit Deposited(account,amount) and Withdrawn(account,amount). Add liabilities, increasing on deposits and decreasing on successful withdrawals. If a receiver rejects payment, all accounting must remain unchanged.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The deposit entry point credits only msg.sender and records wei. Repeated deposits accumulate.

**Exercise 2.** Checks reject invalid amounts, effects reduce the credit, and the interaction sends value. Failure reverts the effects; the guard rejects nested withdrawal entry.

**Exercise 3.** Liabilities track what is owed independently of actual Ether balance. A failed withdrawal preserves both liabilities and individual credit.
