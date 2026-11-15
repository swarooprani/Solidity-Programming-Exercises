// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
abstract contract Shape {
    function area() public view virtual returns (uint256);
    function kind() public pure virtual returns (string memory) {
        return "Shape";
    }
}
contract Square is Shape {
    uint256 public immutable side;
    constructor(uint256 n) { side = n; }
    function area() public view override returns (uint256) {
        return side * side;
    }
    function kind() public pure override returns (string memory) {
        return "Square";
    }
}