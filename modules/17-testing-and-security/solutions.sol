// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract SecuritySolutions {
    address public immutable owner;
    uint256 public constant MAX_SUPPLY = 1000;
    uint256 public total;
    mapping(address => uint256) public balances;
    constructor() { owner = msg.sender; }
    function issue(address to, uint256 amount) external {
        require(msg.sender == owner && to != address(0), "Not allowed");
        require(amount <= MAX_SUPPLY - total, "Supply limit");
        balances[to] += amount; total += amount;
    }
    function transfer(address to, uint256 amount) external {
        require(to != address(0) && amount <= balances[msg.sender], "Bad transfer");
        balances[msg.sender] -= amount; balances[to] += amount;
    }
}
