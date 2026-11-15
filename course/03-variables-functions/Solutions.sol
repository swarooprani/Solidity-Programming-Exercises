// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract VariablePractice {
    uint256 public constant LIMIT = 500;
    uint256 public count;
    constructor(uint256 start) { require(start <= LIMIT, "Too high"); count = start; }
    function set(uint256 next) external {
        require(next <= LIMIT, "Too high");
        count = next;
    }
}