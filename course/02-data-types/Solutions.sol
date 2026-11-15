// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract TypePractice {
    function max16() external pure returns (uint16) { return type(uint16).max; }
    function min8() external pure returns (int8) { return type(int8).min; }
    function marks(uint256 n) external pure returns (uint8) {
        require(n <= 100, "Marks above 100");
        return uint8(n);
    }
}