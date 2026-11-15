// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IScore { function score() external view returns (uint256); }
library EvenLib {
    function isEven(uint256 n) internal pure returns (bool) { return n % 2 == 0; }
}
contract ScoreTarget { uint256 public score = 15; }
contract ScoreReader {
    using EvenLib for uint256;
    function check(uint256 n) external pure returns (bool) { return n.isEven(); }
    function get(address target) external view returns (uint256) {
        require(target != address(0), "Zero target");
        return IScore(target).score();
    }
}