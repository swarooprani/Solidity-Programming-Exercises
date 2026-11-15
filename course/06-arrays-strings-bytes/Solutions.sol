// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ArrayPractice {
    uint256[3] public marks;
    uint256[] private items;
    function setMarks(uint256 a, uint256 b, uint256 c) external { marks = [a,b,c]; }
    function total() external view returns (uint256) { return marks[0]+marks[1]+marks[2]; }
    function add(uint256 n) external { items.push(n); }
    function replace(uint256 i, uint256 n) external {
        require(i < items.length, "Invalid index");
        items[i] = n;
    }
}