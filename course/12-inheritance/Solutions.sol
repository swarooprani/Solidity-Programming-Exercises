// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
abstract contract Pricing {
    function price(uint256 n) public pure virtual returns (uint256);
    function label() public pure virtual returns (string memory) { return "Pricing"; }
}
contract NormalPrice is Pricing {
    function price(uint256 n) public pure override returns (uint256) { return n * 10; }
}
contract DiscountPrice is Pricing {
    function price(uint256 n) public pure override returns (uint256) { return n * 8; }
    function label() public pure override returns (string memory) {
        return super.label();
    }
}