// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AdminPractice {
    address public owner;
    address public pendingOwner;
    uint256 public count;
    constructor() { owner = msg.sender; }
    modifier onlyOwner() { require(msg.sender == owner, "Not owner"); _; }
    function increment() external { count++; }
    function reset() external onlyOwner { count = 0; }
    function propose(address next) external onlyOwner {
        require(next != address(0), "Zero address");
        pendingOwner = next;
    }
    function accept() external {
        require(msg.sender == pendingOwner, "Not pending");
        owner = pendingOwner;
        pendingOwner = address(0);
    }
}