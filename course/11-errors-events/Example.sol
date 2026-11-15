// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract StockLogger {
    error NotEnough(uint256 requested, uint256 available);
    event StockSold(address indexed buyer, uint256 quantity);
    uint256 public stock = 10;
    function sell(uint256 n) external {
        if (n == 0 || n > stock) revert NotEnough(n, stock);
        stock -= n;
        emit StockSold(msg.sender, n);
    }
}