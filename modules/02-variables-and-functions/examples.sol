// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract FunctionExamples {
    uint256 private count;
    uint256 public constant STEP = 1;

    function increment() external { count += STEP; }
    function read() external view returns (uint256) { return count; }
    function double(uint256 n) external pure returns (uint256) {
        return _double(n);
    }
    function _double(uint256 n) internal pure returns (uint256) {
        return n * 2; // Helper available to derived contracts.
    }
}
