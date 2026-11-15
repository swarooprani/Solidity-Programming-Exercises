// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ConditionsPractice {
    uint256 public score;
    function category(uint256 age) external pure returns (string memory) {
        if (age < 13) return "Child";
        if (age < 20) return "Teen";
        if (age < 60) return "Adult";
        return "Senior";
    }
    function bill(uint256 n) external pure returns (uint256) {
        if (n <= 100) return n * 2;
        if (n <= 200) return 200 + (n - 100) * 3;
        return 500 + (n - 200) * 5;
    }
    function setScore(uint256 n) external {
        require(n <= 100, "Invalid score"); score = n;
    }
}