// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract StartSolutions {
    uint256 public score;
    uint256 public visits;
    function setScore(uint256 value) external { score = value; }
    function visit() external { visits++; }
    function resetVisits() external {
        visits = 0; // Resets only this variable, not the entire contract.
    }
}
