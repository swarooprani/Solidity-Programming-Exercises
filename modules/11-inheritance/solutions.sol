// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract BaseFee {
    function fee() public pure virtual returns (uint256) { return 5; }
}
contract StudentFee is BaseFee {
    function fee() public pure override returns (uint256) { return 2; }
}
contract PremiumFee is BaseFee {
    function fee() public pure override returns (uint256) { return super.fee() + 3; }
}
abstract contract Area {
    function area() public view virtual returns (uint256);
}
contract Rectangle is Area {
    uint256 public width;
    uint256 public height;
    constructor(uint256 w, uint256 h) { width = w; height = h; }
    function area() public view override returns (uint256) { return width * height; }
}
