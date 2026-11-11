// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract ConditionalExamples {
    function grade(uint256 marks) external pure returns (string memory) {
        require(marks <= 100, "Marks above 100");
        if (marks >= 80) return "A";
        else if (marks >= 60) return "B";
        else if (marks >= 40) return "C";
        else return "Fail";
    }
}
