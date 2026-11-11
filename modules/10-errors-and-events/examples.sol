// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract ErrorEventExamples {
    error TooLarge(uint256 supplied, uint256 maximum);
    event ValueChanged(address indexed caller, uint256 oldValue, uint256 newValue);
    uint256 public value;
    function set(uint256 next) external {
        if (next > 100) revert TooLarge(next, 100);
        uint256 old = value;
        value = next;
        emit ValueChanged(msg.sender, old, next);
        assert(value <= 100); // An internal property after validated assignment.
    }
}
