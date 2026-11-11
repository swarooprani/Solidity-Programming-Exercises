// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract TypeSolutions {
    function square(uint256 n) external pure returns (uint256) { return n * n; }
    function percentage(uint256 amount, uint256 rate) external pure returns (uint256) {
        require(rate <= 100, "Rate above 100");
        return amount * rate / 100; // Deliberately rounds down.
    }
    function toUint8(uint256 n) external pure returns (uint8) {
        require(n <= type(uint8).max, "Out of range");
        return uint8(n); // Safe because the range was checked.
    }
}
