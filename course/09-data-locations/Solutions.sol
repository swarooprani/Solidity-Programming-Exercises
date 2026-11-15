// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract LocationPractice {
    uint256[] public values;
    function add(uint256 n) external { values.push(n); }
    function sum(uint256[] calldata numbers) external pure returns (uint256 total) {
        require(numbers.length <= 50, "Too many");
        for (uint256 i; i < numbers.length; i++) total += numbers[i];
    }
    function copyFirst() external view returns (uint256) {
        require(values.length > 0, "Empty");
        uint256[] memory copy = values;
        copy[0] = 111;
        return copy[0];
    }
    function editFirst(uint256 n) external {
        require(values.length > 0, "Empty");
        uint256[] storage aliasValues = values;
        aliasValues[0] = n;
    }
}