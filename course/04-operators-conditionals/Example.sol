// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract SlabCalculator {
    function calculate(uint256 units) external pure returns (uint256) {
        if (units <= 100) return units * 2;
        if (units <= 200) return 200 + (units - 100) * 3;
        return 500 + (units - 200) * 5;
    }
    function withinRange(uint256 n) external pure returns (bool) {
        return n >= 10 && n <= 20; // Both endpoints inclusive.
    }
}