// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract DonationPractice {
    mapping(address => uint256) public credit;
    event Donation(address indexed from, uint256 amount);
    function donate() external payable {
        require(msg.value > 0, "Nothing sent");
        credit[msg.sender] += msg.value;
        emit Donation(msg.sender, msg.value);
    }
    function withdrawAll() external {
        uint256 amount = credit[msg.sender];
        require(amount > 0, "Nothing available");
        credit[msg.sender] = 0;
        (bool ok,) = payable(msg.sender).call{value: amount}("");
        require(ok, "Transfer failed");
    }
}