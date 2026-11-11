# Library with borrower identity

Prerequisite: complete modules 00–17. Work from the specification before viewing [the reference implementation](solution.sol).

## Specification

Combine records, legal state transitions and caller identity.

Track single-copy books by ID. Only the deploying librarian may add a book, and IDs cannot be reused. A title must contain 1..100 bytes. Any account may borrow an available book, but only its recorded borrower may return it. Missing IDs must be rejected. There is no fee, lending deadline or claim that a wallet is a verified person.

Required API: owner(), addBook(id,title), borrow(id), giveBack(id), getBook(id), and BookAdded/Borrowed/Returned events. A book is available exactly when its borrower is address(0). Verify missing IDs, duplicates, empty/oversized titles, unauthorized additions, double borrowing, wrong-account returns and repeat returns.

## Acceptance walkthrough

A adds book 1, "Solidity". B borrows it; getBook(1) reports B. A cannot return B's book. B returns it; the borrower becomes the zero address. A can now borrow it. A return does not create a missing book.

Compile solution.sol and select `BorrowerLibrary`. Use different Remix accounts for different actors. Run the normal path and every rejection specified above. The local test suite verifies these reference contracts as well.

## Submission

Provide your contract, a short README with setup/call instructions, a test matrix with expected outcomes, and a paragraph explaining the access model and limitations. Include evidence of failed calls preserving state.

## Rubric (100 points)

| Criterion | Points |
|---|---:|
| Required valid behavior | 30 |
| Input validation and rejection cases | 20 |
| Permissions and state transitions | 20 |
| Tests, including state preservation | 20 |
| Clear comments, units and run instructions | 10 |

## Optional extensions (not implemented in the reference)

- Add due timestamps and explicitly define who can enforce overdue transitions.
- Support several copies using a separate loan identifier.
- Add a paginated catalog while preserving stable book IDs.

[All projects](../README.md) | [Course home](../../README.md)
