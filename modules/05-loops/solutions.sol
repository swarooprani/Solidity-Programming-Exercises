// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract LoopSolutions {
    function countEven(uint256[] calldata a) external pure returns (uint256 count) {
        require(a.length <= 100, "At most 100 items");
        for (uint256 i = 0; i < a.length; i++) if (a[i] % 2 == 0) count++;
    }
    function find(uint256[] calldata a, uint256 target) external pure returns (bool, uint256) {
        require(a.length <= 100, "At most 100 items");
        for (uint256 i = 0; i < a.length; i++) {
            if (a[i] == target) return (true, i);
        }
        return (false, 0);
    }
    function reverse(uint256[] calldata a) external pure returns (uint256[] memory result) {
        require(a.length <= 100, "At most 100 items");
        result = new uint256[](a.length);
        for (uint256 i = 0; i < a.length; i++) result[i] = a[a.length - 1 - i];
    }
}
