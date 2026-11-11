// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract EtherSolutions {
    mapping(address => uint256) public balanceOf;
    uint256 public liabilities;
    bool private entered;
    event Deposited(address indexed account, uint256 amount);
    event Withdrawn(address indexed account, uint256 amount);
    modifier nonReentrant() {
        require(!entered, "Reentrant call"); entered = true; _; entered = false;
    }
    function deposit() external payable nonReentrant {
        require(msg.value > 0, "Zero deposit");
        balanceOf[msg.sender] += msg.value; liabilities += msg.value;
        emit Deposited(msg.sender, msg.value);
    }
    function withdraw(uint256 amount) external nonReentrant {
        require(amount > 0 && amount <= balanceOf[msg.sender], "Invalid withdrawal");
        balanceOf[msg.sender] -= amount; liabilities -= amount; // Effects first.
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok, "Transfer failed"); // Reverts accounting if payment fails.
        emit Withdrawn(msg.sender, amount);
    }
}
