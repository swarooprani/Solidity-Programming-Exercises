// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract IntroCounterPractice {
    uint256 public count;
    function set(uint256 n) external { count = n; }
    function increase() external { count++; }
}