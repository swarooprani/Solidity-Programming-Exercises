// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract ConditionalSolutions {
    function larger(uint256 a, uint256 b) external pure returns (uint256) {
        return a > b ? a : b;
    }
    function bill(uint256 units) external pure returns (uint256) {
        if (units <= 100) return units * 2;
        if (units <= 200) return 200 + (units - 100) * 3;
        return 500 + (units - 200) * 5;
    }
    function category(uint256 age) external pure returns (string memory) {
        require(age <= 150, "Age above exercise limit");
        if (age < 13) return "Child";
        if (age < 20) return "Teen";
        if (age < 60) return "Adult";
        return "Senior";
    }
}
