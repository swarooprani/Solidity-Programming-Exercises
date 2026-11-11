// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
interface IReadValue {
    function read() external view returns (uint256);
}
library DoubleMath {
    function twice(uint256 n) internal pure returns (uint256) { return n * 2; }
}
contract ValueSource is IReadValue {
    function read() external pure override returns (uint256) { return 21; }
}
contract ValueConsumer {
    using DoubleMath for uint256;
    IReadValue public source;
    constructor(address sourceAddress) { source = IReadValue(sourceAddress); }
    function doubled() external view returns (uint256) {
        uint256 n = source.read(); return n.twice();
    }
}
