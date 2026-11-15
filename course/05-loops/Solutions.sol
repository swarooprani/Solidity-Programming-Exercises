// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract LoopPractice {
    function factorial(uint256 n) external pure returns (uint256 out) {
        require(n <= 20, "Too large"); out = 1;
        for (uint256 i = 2; i <= n; i++) out *= i;
    }
    function sumEvenBelow(uint256 n) external pure returns (uint256 sum) {
        require(n <= 100, "Too large");
        uint256 i;
        while (i < n) { if (i % 2 != 0) { i++; continue; } sum += i; i++; }
    }
    function firstSeven(uint256 n) external pure returns (uint256 out) {
        require(n <= 100, "Too large");
        for (uint256 i = 1; i <= n; i++) { if (i % 7 == 0) { out = i; break; } }
    }
}