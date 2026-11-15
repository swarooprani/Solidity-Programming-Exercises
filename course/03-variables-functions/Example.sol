// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract VariableDemo {
    uint256 public count; // Persistent state.
    address public immutable owner; // Set once during deployment.
    uint256 public constant LIMIT = 100;
    constructor(uint256 initialCount) {
        require(initialCount <= LIMIT, "Too large");
        owner = msg.sender;
        count = initialCount;
    }
    function add(uint256 by) external {
        require(count + by <= LIMIT, "Exceeds limit");
        count += by;
    }
    function double(uint256 n) external pure returns (uint256) {
        uint256 localResult = n * 2; // Local, temporary.
        return localResult;
    }
    function readCount() external view returns (uint256) { return count; }
}