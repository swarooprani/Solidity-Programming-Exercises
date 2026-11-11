// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract DivisionService {
    function divide(uint256 a, uint256 b) external pure returns (uint256) {
        require(b > 0, "Zero divisor"); return a / b;
    }
}
contract CallExamples {
    DivisionService public service;
    constructor(address target) { service = DivisionService(target); }
    function safeDivide(uint256 a, uint256 b) external view returns (bool ok, uint256 value) {
        try service.divide(a, b) returns (uint256 result) {
            return (true, result);
        } catch {
            return (false, 0); // An explicit failure result, not a valid quotient.
        }
    }
}
