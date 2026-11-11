// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract LocationSolutions {
    uint256[] public data;
    constructor() { data.push(2); data.push(4); }
    function withFirst(uint256 n) external view returns (uint256[] memory copy) {
        copy = data; copy[0] = n;
    }
    function setFirst(uint256 n) external {
        uint256[] storage refData = data; refData[0] = n;
    }
    function aliasDemo() external pure returns (uint256) {
        uint256[] memory a = new uint256[](1); a[0] = 1;
        uint256[] memory b = a; b[0] = 7;
        return a[0]; // b and a refer to the same memory array.
    }
}
