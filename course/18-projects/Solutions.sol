// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract GradebookCapstone {
    address public immutable teacher;
    mapping(uint256 => uint256) public grade;
    mapping(uint256 => bool) public recorded;
    constructor() { teacher = msg.sender; }
    function setGrade(uint256 id, uint256 value) external {
        require(msg.sender == teacher && value <= 100, "Not allowed");
        grade[id] = value; recorded[id] = true;
    }
}
contract InventoryCapstone {
    mapping(uint256 => uint256) public stock;
    function add(uint256 id, uint256 qty) external {
        require(qty > 0, "Zero");
        stock[id] += qty;
    }
    function sell(uint256 id, uint256 qty) external {
        require(qty > 0 && stock[id] >= qty, "Unavailable");
        stock[id] -= qty;
    }
}
contract EventCapstone {
    uint256 public constant MAX = 50;
    uint256 public count;
    mapping(address => bool) public enrolled;
    function register() external {
        require(!enrolled[msg.sender] && count < MAX, "Unavailable");
        enrolled[msg.sender] = true; count++;
    }
    function cancel() external {
        require(enrolled[msg.sender], "Not registered");
        enrolled[msg.sender] = false; count--;
    }
}