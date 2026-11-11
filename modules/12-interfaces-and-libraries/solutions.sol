// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
interface IFeeReader { function fee() external view returns (uint256); }
contract FixedFeeSource is IFeeReader {
    function fee() external pure override returns (uint256) { return 7; }
}
library LimitMath {
    function cap(uint256 n, uint256 maximum) internal pure returns (uint256) {
        return n > maximum ? maximum : n;
    }
}
contract LibrarySolutions {
    using LimitMath for uint256;
    function capped(uint256 n, uint256 maximum) external pure returns (uint256) {
        return n.cap(maximum);
    }
}
contract FeeConsumer {
    IFeeReader public source;
    constructor(address target) {
        require(target != address(0), "Zero source"); source = IFeeReader(target);
    }
    function quote() external view returns (uint256) { return source.fee(); }
}
