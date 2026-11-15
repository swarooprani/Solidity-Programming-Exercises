// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ArrayDemo {
    uint256[] private values; // Dynamic storage array.
    function add(uint256 value) external { values.push(value); }
    function removeLast() external {
        require(values.length > 0, "Empty");
        values.pop();
    }
    function at(uint256 index) external view returns (uint256) {
        return values[index]; // Invalid index reverts.
    }
    function length() external view returns (uint256) { return values.length; }
    function textByteLength(string calldata s) external pure returns (uint256) {
        return bytes(s).length; // UTF-8 bytes, not characters.
    }
}