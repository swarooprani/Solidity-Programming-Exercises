// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: SIMPLE QUIZ SCORE MANAGEMENT
Store quiz scores using student ID as the mapping key. Only the teacher
(contract owner) may enter/update scores. Scores cannot exceed 20.
A score of 10 or more is a pass. Provide a function to retrieve the score.
A second mapping distinguishes a real score of zero from no score entered.
*/
contract SimpleQuizScoreManagement {
    address public owner; // The deploying account is the teacher/owner.
    mapping(uint256 => uint256) public quizScore; // Student ID => score.
    mapping(uint256 => bool) public scoreEntered; // Student ID => whether a score was entered.

    constructor() {
        owner = msg.sender; // Saves the deployer's address as the owner.
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the teacher can enter scores");
        // Allows only the saved owner to continue.
        _;
        // Executes the protected function body after the check passes.
    }

    function enterScore(uint256 studentId, uint256 score) public onlyOwner {
        // Inputs are the student ID and quiz score; onlyOwner restricts access.
        require(score <= 20, "Quiz score cannot exceed 20");
        // uint256 prevents negative scores; this check enforces the maximum.
        quizScore[studentId] = score; // Saves or updates the student's score.
        scoreEntered[studentId] = true; // Records that a score was explicitly entered.
    }

    function hasPassed(uint256 studentId) public view returns (bool) {
        // view reads the score; bool result is true or false.
        require(scoreEntered[studentId], "No score has been entered");
        // Avoids treating the mapping's default zero as an actual entered score.
        return quizScore[studentId] >= 10; // 10-20 passes; below 10 does not pass.
    }

    function getScore(uint256 studentId) public view returns (uint256) {
        require(scoreEntered[studentId], "No score has been entered");
        // Checks that this student has a recorded score.
        return quizScore[studentId]; // Returns the stored score.
    }
}
