// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract TypeDemo {
    uint8 public small = 12; // Exactly 8 bits; range 0..255.
    bool public active = true;
    address public creator;
    constructor() { creator = msg.sender; }
    function maxSmall() external pure returns (uint8) { return type(uint8).max; }
    function validAge(uint256 age) external pure returns (bool) {
        return age <= 150;
    }
    function safelyNarrow(uint256 n) external pure returns (uint8) {
        require(n <= type(uint8).max, "Out of range");
        return uint8(n); // Cast after bounds checking.
    }
}