// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract DepositExamples {
    mapping(address => uint256) public credit;
    function deposit() external payable {
        require(msg.value > 0, "Zero deposit");
        credit[msg.sender] += msg.value;
    }
    function contractBalance() external view returns (uint256) {
        return address(this).balance;
    }
    // Deposit-only teaching example. Withdrawals are implemented in solutions.sol.
}
