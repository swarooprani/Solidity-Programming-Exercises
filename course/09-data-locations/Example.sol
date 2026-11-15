// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract LocationDemo {
    uint256[] private values;
    function add(uint256 n) external { values.push(n); }
    function original(uint256 i) external view returns (uint256) {
        return values[i];
    }
    function changedCopy() external view returns (uint256) {
        require(values.length > 0, "Empty");
        uint256[] memory copy = values; // Independent copy.
        copy[0] = 99;
        return copy[0]; // Storage remains unchanged.
    }
    function changeStorage(uint256 n) external {
        require(values.length > 0, "Empty");
        uint256[] storage aliasValues = values; // References persistent array.
        aliasValues[0] = n;
    }
    function firstInput(uint256[] calldata incoming) external pure returns (uint256) {
        require(incoming.length > 0, "Empty");
        return incoming[0]; // calldata is read-only.
    }
}