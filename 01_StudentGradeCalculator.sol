// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: STUDENT GRADE CALCULATOR
Store one student's marks in three subjects, validate that each mark is
not above 100, and provide functions to return the total and average.
Example: 85, 90, 75 -> total 250; average 83 (integer division).
This contract stores one set of marks, not multiple student records.
*/
contract StudentGradeCalculator {
    uint256 public subject1Marks; // State variable: stored Subject 1 marks; public creates a getter.
    uint256 public subject2Marks; // State variable: stored Subject 2 marks.
    uint256 public subject3Marks; // State variable: stored Subject 3 marks.

    function enterMarks(uint256 _marks1, uint256 _marks2, uint256 _marks3) public {
        // Parameters receive the three values supplied by the caller.
        // uint256 is an unsigned whole number, so negative marks cannot be entered.
        require(_marks1 <= 100, "Subject 1 marks cannot exceed 100"); // Rejects marks above 100.
        require(_marks2 <= 100, "Subject 2 marks cannot exceed 100"); // Validates Subject 2.
        require(_marks3 <= 100, "Subject 3 marks cannot exceed 100"); // Validates Subject 3.
        subject1Marks = _marks1; // Saves the first input in contract storage.
        subject2Marks = _marks2; // Saves the second input in contract storage.
        subject3Marks = _marks3; // Saves the third input in contract storage.
    }

    function calculateTotal() public view returns (uint256) {
        // view: reads stored values but does not change them.
        // returns (uint256): sends one unsigned whole number back to the caller.
        uint256 total = subject1Marks + subject2Marks + subject3Marks; // Local temporary sum.
        return total; // Returns the sum.
    }

    function calculateAverage() public view returns (uint256) {
        // This is view because it only reads the stored marks.
        uint256 total = subject1Marks + subject2Marks + subject3Marks; // Adds all three marks.
        uint256 average = total / 3; // Integer division discards any fractional part (250 / 3 = 83).
        return average; // Returns the whole-number average.
    }
}
