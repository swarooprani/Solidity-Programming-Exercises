# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 07.1: Create a book record

Define a Book with title, borrowed and exists. Implement addBook(id,title) and public books. Reject duplicate IDs and empty titles. Adding ID 1 with "EVM" creates an available book.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 07.2: Borrow and return

Add borrow(id) and giveBack(id). Missing books, duplicate borrowing and returning an available book must revert. This exercise tracks status only, not borrower identity.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 07.3: A three-stage order

Define Stage {Created, Paid, Shipped}, public stage, pay(), ship(). Fresh stage is Created. ship before pay reverts; pay then ship succeeds; repeated transitions revert. No Ether transfer is involved.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** An explicit exists flag prevents duplicate IDs even when a valid title or other fields could resemble defaults.

**Exercise 2.** Borrow and return validate opposite states. This version intentionally does not enforce borrower identity; the library capstone adds it.

**Exercise 3.** Each function checks exactly the state it may leave. The enum names stages, while the require statements enforce the transition graph.
