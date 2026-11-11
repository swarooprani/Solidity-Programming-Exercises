// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract MappingExamples {
    mapping(address => bool) public enrolled;
    function enroll() external {
        require(!enrolled[msg.sender], "Already enrolled");
        enrolled[msg.sender] = true; // The caller changes only their own entry.
    }
    function leave() external { delete enrolled[msg.sender]; }
}
