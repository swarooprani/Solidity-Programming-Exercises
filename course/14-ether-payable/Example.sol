// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract SimulatedVault {
    mapping(address => uint256) public credit;
    event Deposited(address indexed sender, uint256 amount);
    function deposit() external payable {
        require(msg.value > 0, "Send wei");
        credit[msg.sender] += msg.value;
        emit Deposited(msg.sender, msg.value);
    }
    function withdraw(uint256 amount) external {
        require(amount > 0 && credit[msg.sender] >= amount, "Insufficient");
        credit[msg.sender] -= amount; // Effect before interaction.
        (bool success,) = payable(msg.sender).call{value: amount}("");
        require(success, "Payout failed"); // Revert credit change if failed.
    }
}