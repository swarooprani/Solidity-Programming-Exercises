// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract OwnerExamples {
    address public immutable owner;
    uint256 public limit;
    constructor(uint256 initialLimit) {
        owner = msg.sender; limit = initialLimit;
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _; // Execute the function body only after the check.
    }
    function setLimit(uint256 n) external onlyOwner { limit = n; }
}
