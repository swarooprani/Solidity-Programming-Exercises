// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface ICounter {
    function count() external view returns (uint256);
}
library NumberTools {
    function doubled(uint256 n) internal pure returns (uint256) {
        return n * 2;
    }
}
contract CounterTarget {
    uint256 public count = 7;
}
contract CounterReader {
    using NumberTools for uint256;
    function read(address target) external view returns (uint256) {
        require(target != address(0), "Zero target");
        return ICounter(target).count();
    }
    function twice(uint256 n) external pure returns (uint256) {
        return n.doubled();
    }
}