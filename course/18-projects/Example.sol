// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract CourseGradebook {
    address public immutable teacher;
    struct Grade { uint256 score; bool exists; }
    mapping(uint256 => Grade) private grades;
    event Saved(uint256 indexed studentId, uint256 score);
    constructor() { teacher = msg.sender; }
    function setGrade(uint256 id, uint256 value) external {
        require(msg.sender == teacher, "Teacher only");
        require(value <= 100, "Invalid grade");
        grades[id] = Grade(value, true);
        emit Saved(id, value);
    }
    function getGrade(uint256 id) external view returns (bool, uint256) {
        Grade storage g = grades[id];
        return (g.exists, g.score);
    }
}