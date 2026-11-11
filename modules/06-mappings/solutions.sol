// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract MappingSolutions {
    mapping(uint256 => uint256) public scores;
    mapping(uint256 => bool) public exists;
    mapping(address => mapping(uint256 => bool)) public joined;
    function setScore(uint256 id, uint256 score) external {
        require(score <= 100, "Score above 100");
        scores[id] = score; exists[id] = true;
    }
    function getScore(uint256 id) external view returns (uint256) {
        require(exists[id], "Missing score"); return scores[id];
    }
    function remove(uint256 id) external { delete scores[id]; delete exists[id]; }
    function join(uint256 courseId) external {
        require(!joined[msg.sender][courseId], "Already joined");
        joined[msg.sender][courseId] = true;
    }
}
