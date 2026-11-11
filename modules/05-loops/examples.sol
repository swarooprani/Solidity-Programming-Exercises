// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract LoopExamples {
    function sum(uint256[] calldata a) external pure returns (uint256 total) {
        require(a.length <= 100, "At most 100 items");
        for (uint256 i = 0; i < a.length; i++) {
            total += a[i];
        }
    }
    function halves(uint256 n) external pure returns (uint256 count) {
        while (n > 0) { n /= 2; count++; } // At most 256 iterations.
    }
    function digits(uint256 n) external pure returns (uint256 count) {
        do { count++; n /= 10; } while (n > 0); // Zero has one digit.
    }
    function positivesBeforeZero(int256[] calldata a) external pure returns (int256 total) {
        require(a.length <= 100, "At most 100 items");
        for (uint256 i = 0; i < a.length; i++) {
            if (a[i] == 0) break;
            if (a[i] < 0) continue;
            total += a[i];
        }
    }
}
