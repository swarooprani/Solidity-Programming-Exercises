// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract FunctionSolutions {
    uint256 private value;
    function set(uint256 n) external { value = n; }
    function get() external view returns (uint256) { return value; }
    function minMax(uint256 a, uint256 b) external pure returns (uint256, uint256) {
        return a <= b ? (a, b) : (b, a);
    }
    function addDouble(uint256 n) external { value += _twice(n); }
    function _twice(uint256 n) internal pure returns (uint256) { return n * 2; }
}
