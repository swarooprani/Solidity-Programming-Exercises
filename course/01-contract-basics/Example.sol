// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ContractParts {
    uint256 public lastValue; // Automatic getter: lastValue().
    function doubled(uint256 value) external pure returns (uint256) {
        return value * 2; // No storage read or write.
    }
    function save(uint256 value) external {
        lastValue = value; // This does write storage.
    }
}