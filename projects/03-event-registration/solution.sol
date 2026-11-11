// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Educational reference implementation; see README.md for the specification.
contract EventRegistration {
    address public immutable organizer;
    uint256 public immutable capacity;
    uint256 public count;
    bool public open = true;
    mapping(address => bool) public registered;
    event Registered(address indexed participant);
    event Cancelled(address indexed participant);
    event OpenChanged(bool open);
    constructor(uint256 maxSeats) {
        require(maxSeats > 0 && maxSeats <= 100, "Capacity 1 to 100");
        organizer = msg.sender; capacity = maxSeats;
    }
    function register() external {
        require(open && !registered[msg.sender] && count < capacity, "Cannot register");
        registered[msg.sender] = true; count++; emit Registered(msg.sender);
    }
    function cancel() external {
        require(registered[msg.sender], "Not registered");
        delete registered[msg.sender]; count--; emit Cancelled(msg.sender);
    }
    function setOpen(bool status) external {
        require(msg.sender == organizer, "Not organizer");
        open = status; emit OpenChanged(status);
    }
    function remaining() external view returns (uint256) { return capacity - count; }
}
