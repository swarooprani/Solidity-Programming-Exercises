// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract StockEventsPractice {
    error InvalidQuantity();
    event Restocked(uint256 added);
    event Sold(uint256 amount);
    uint256 public stock;
    function restock(uint256 n) external {
        if (n == 0) revert InvalidQuantity();
        stock += n; emit Restocked(n);
    }
    function sell(uint256 n) external {
        if (n == 0 || n > stock) revert InvalidQuantity();
        stock -= n; emit Sold(n);
    }
}