// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MappingDemo {
    mapping(uint256 => uint256) private scores;
    mapping(uint256 => bool) private exists;
    function save(uint256 id, uint256 score) external {
        require(score <= 100, "Bad score");
        scores[id] = score;
        exists[id] = true;
    }
    function lookup(uint256 id) external view returns (bool, uint256) {
        return (exists[id], scores[id]);
    }
    function erase(uint256 id) external {
        delete scores[id]; delete exists[id];
    }
}