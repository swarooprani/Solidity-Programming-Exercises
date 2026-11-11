// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Educational reference implementation; see README.md for the specification.
contract BorrowerLibrary {
    struct Book { string title; address borrower; bool exists; }
    address public immutable owner;
    mapping(uint256 => Book) private books;
    event BookAdded(uint256 indexed id, string title);
    event Borrowed(uint256 indexed id, address indexed borrower);
    event Returned(uint256 indexed id, address indexed borrower);
    constructor() { owner = msg.sender; }
    function addBook(uint256 id, string calldata title) external {
        require(msg.sender == owner, "Not librarian");
        require(!books[id].exists, "Duplicate ID");
        require(bytes(title).length > 0 && bytes(title).length <= 100, "Bad title");
        books[id] = Book(title, address(0), true); emit BookAdded(id, title);
    }
    function borrow(uint256 id) external {
        Book storage book = books[id];
        require(book.exists && book.borrower == address(0), "Unavailable");
        book.borrower = msg.sender; emit Borrowed(id, msg.sender);
    }
    function giveBack(uint256 id) external {
        Book storage book = books[id];
        require(book.exists && book.borrower == msg.sender, "Not borrower");
        book.borrower = address(0); emit Returned(id, msg.sender);
    }
    function getBook(uint256 id) external view returns (string memory, address) {
        require(books[id].exists, "Missing book");
        return (books[id].title, books[id].borrower);
    }
}
