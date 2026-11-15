// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MappingPractice {
    mapping(uint256 => bool) public present;
    mapping(uint256 => bool) public marked;
    mapping(address => mapping(address => bool)) public delegates;
    function attendance(uint256 id, bool isPresent) external {
        marked[id] = true; present[id] = isPresent;
    }
    function setDelegation(address delegate, bool allowed) external {
        delegates[msg.sender][delegate] = allowed;
    }
}