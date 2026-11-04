// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: AGE CATEGORY CHECKER
Accept an age and return its category:
Below 13 = Child; 13-19 = Teenager; 20-59 = Adult; 60 and above = Senior Citizen.
Do not store the age permanently. Use a function parameter and return a category.
*/
contract AgeCategoryChecker {
    function checkAge(uint256 age) public pure returns (string memory) {
        // age is an input parameter; uint256 allows zero or positive whole numbers only.
        // pure: no contract state is read or changed.
        // string memory: returned text is held temporarily in memory, not stored as state.
        if (age < 13) {
            return "Child"; // Ages 0 through 12.
        } else if (age <= 19) {
            return "Teenager"; // Reached only after age >= 13, so this covers 13 through 19.
        } else if (age <= 59) {
            return "Adult"; // Earlier tests failed, so this covers 20 through 59.
        } else {
            return "Senior Citizen"; // All remaining ages are 60 or above.
        }
    }
}
