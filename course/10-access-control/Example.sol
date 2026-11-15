// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AdminSettings {
    address public immutable owner;
    uint256 public limit = 10;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _; // Only now execute the function body.
    }
    function setLimit(uint256 n) external onlyOwner {
        require(n > 0, "Positive limit required");
        limit = n;
    }
}