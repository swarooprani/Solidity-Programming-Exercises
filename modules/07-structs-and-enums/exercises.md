# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 07.1: Create a book record — Warm-up

Define a Book with title, borrowed and exists. Implement addBook(id,title) and public books. Reject duplicate IDs and empty titles. Adding ID 1 with "EVM" creates an available book.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 07.2: Borrow and return — Application

Add borrow(id) and giveBack(id). Missing books, duplicate borrowing and returning an available book must revert. This exercise tracks status only, not borrower identity.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 07.3: A three-stage order — Challenge

Define Stage {Created, Paid, Shipped}, public stage, pay(), ship(). Fresh stage is Created. ship before pay reverts; pay then ship succeeds; repeated transitions revert. No Ether transfer is involved.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
