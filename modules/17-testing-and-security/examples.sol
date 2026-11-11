// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract PointLedger {
    address public immutable owner;
    mapping(address => uint256) public balanceOf;
    uint256 public total;
    constructor() { owner = msg.sender; }
    function issue(address recipient, uint256 amount) external {
        require(msg.sender == owner && recipient != address(0), "Not allowed");
        balanceOf[recipient] += amount; total += amount;
    }
    function transfer(address recipient, uint256 amount) external {
        require(recipient != address(0) && amount <= balanceOf[msg.sender], "Invalid transfer");
        balanceOf[msg.sender] -= amount; balanceOf[recipient] += amount;
        // total does not change. No external calls or Ether are involved.
    }
}
