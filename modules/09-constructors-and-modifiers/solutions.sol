// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract AccessSolutions {
    address public owner;
    uint256 public value;
    bool public paused;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner, "Not owner"); _; }
    function setValue(uint256 n) external onlyOwner {
        require(!paused, "Paused"); value = n;
    }
    function transferOwner(address next) external onlyOwner {
        require(next != address(0), "Zero owner"); owner = next;
    }
    function setPaused(bool status) external onlyOwner { paused = status; }
}
