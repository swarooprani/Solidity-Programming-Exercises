// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract TypeExamples {
    function quotientAndRemainder(uint256 a, uint256 b)
        external pure returns (uint256 quotient, uint256 remainder)
    {
        require(b != 0, "Zero divisor");
        return (a / b, a % b);
    }
    function isEven(uint256 value) external pure returns (bool) {
        return value % 2 == 0;
    }
    function oneEtherInWei() external pure returns (uint256) {
        return 1 ether; // A number, not an Ether transfer.
    }
}
