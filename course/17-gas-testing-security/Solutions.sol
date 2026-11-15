// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract PagedSumPractice {
    uint256[] public values;
    function add(uint256 value) external { values.push(value); }
    function pageSum(uint256 start, uint256 count)
        external view returns (uint256 sum)
    {
        require(count <= 20, "Too many");
        require(start <= values.length, "Bad start");
        require(count <= values.length - start, "Out of bounds");
        for (uint256 i = start; i < start + count; i++) {
            sum += values[i];
        }
    }
}