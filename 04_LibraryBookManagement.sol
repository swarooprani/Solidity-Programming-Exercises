// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: LIBRARY BOOK MANAGEMENT
Track available and issued copies of a book. Issue only when a copy is
available. Accept a return only when at least one copy is issued.
Enter the initial available-book count when deploying the contract.
*/
contract LibraryBookManagement {
    uint256 public availableBooks; // Number of copies currently available; public creates a getter.
    uint256 public issuedBooks; // Number of copies currently issued; used to validate returns.

    constructor(uint256 _initialBooks) {
        // Constructor runs once at deployment; parameter is the starting stock.
        availableBooks = _initialBooks; // Sets the initial number of available copies.
    }

    function issueBook() public {
        require(availableBooks > 0, "No books are currently available");
        // require checks a condition; if false, the operation is reverted.
        availableBooks = availableBooks - 1; // One copy is no longer available.
        issuedBooks = issuedBooks + 1; // One more copy is now issued.
    }

    function returnBook() public {
        require(issuedBooks > 0, "No issued book is available to return");
        // Prevents a return when the contract has no issued copies.
        issuedBooks = issuedBooks - 1; // One fewer copy is issued.
        availableBooks = availableBooks + 1; // The returned copy becomes available.
    }

    function getAvailableBooks() public view returns (uint256) {
        // view reads state without changing it; returns specifies the output type.
        return availableBooks; // Sends the current available count to the caller.
    }
}
