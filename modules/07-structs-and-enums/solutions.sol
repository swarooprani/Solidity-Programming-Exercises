// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract StructSolutions {
    struct Book { string title; bool borrowed; bool exists; }
    mapping(uint256 => Book) public books;
    enum Stage { Created, Paid, Shipped }
    Stage public stage;
    function addBook(uint256 id, string calldata title) external {
        require(!books[id].exists && bytes(title).length > 0, "Invalid book");
        books[id] = Book(title, false, true);
    }
    function borrow(uint256 id) external {
        require(books[id].exists && !books[id].borrowed, "Not available");
        books[id].borrowed = true;
    }
    function giveBack(uint256 id) external {
        require(books[id].exists && books[id].borrowed, "Not borrowed");
        books[id].borrowed = false;
    }
    function pay() external {
        require(stage == Stage.Created, "Wrong stage"); stage = Stage.Paid;
    }
    function ship() external {
        require(stage == Stage.Paid, "Wrong stage"); stage = Stage.Shipped;
    }
}
