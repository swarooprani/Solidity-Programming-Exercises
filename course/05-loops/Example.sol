// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract LoopDemo {
    function sumTo(uint256 n) external pure returns (uint256 sum) {
        require(n <= 100, "Bounded demonstration");
        for (uint256 i = 1; i <= n; i++) sum += i;
    }
    function countOddBelow(uint256 n) external pure returns (uint256 count) {
        require(n <= 100, "Bounded demonstration");
        uint256 i;
        while (i < n) {
            if (i % 2 == 0) { i++; continue; }
            count++;
            i++;
        }
    }
    function firstMultipleOfThree(uint256 upper) external pure returns (uint256) {
        require(upper <= 100, "Bounded demonstration");
        for (uint256 i = 1; i <= upper; i++) {
            if (i % 3 == 0) return i;
        }
        return 0;
    }
}