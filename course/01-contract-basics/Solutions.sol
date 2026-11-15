// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ContractPartsPractice {
    uint256 public count;
    function setCount(uint256 n) external { count = n; }
    function triple(uint256 n) external pure returns (uint256) { return n * 3; }
}