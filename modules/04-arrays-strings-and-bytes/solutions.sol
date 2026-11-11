// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract ArraySolutions {
    uint256[] public items;
    constructor() { items.push(10); items.push(20); items.push(30); }
    function last(uint256[] calldata a) external pure returns (uint256) {
        require(a.length > 0, "Empty array");
        return a[a.length - 1];
    }
    function swap(uint256 i, uint256 j) external {
        require(i < items.length && j < items.length, "Bad index");
        (items[i], items[j]) = (items[j], items[i]);
    }
    function length() external view returns (uint256) { return items.length; }
    function nonempty(string calldata text) external pure returns (bool) {
        return bytes(text).length > 0;
    }
}
