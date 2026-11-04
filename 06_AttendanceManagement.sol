// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: ATTENDANCE MANAGEMENT
Use a mapping with student ID as key to mark students present or absent.
Provide functions to mark present, mark absent, and check attendance.
A second mapping is included to distinguish "not marked" from "marked absent":
a bool mapping's default value is false, which otherwise means both.
*/
contract AttendanceManagement {
    mapping(uint256 => bool) public isPresent;
    // Student ID => true (present) or false (absent).
    mapping(uint256 => bool) public attendanceMarked;
    // Student ID => true if attendance has explicitly been recorded.

    function markPresent(uint256 studentId) public {
        isPresent[studentId] = true; // Square brackets access the value for this student ID.
        attendanceMarked[studentId] = true; // Records that attendance has been entered.
    }

    function markAbsent(uint256 studentId) public {
        isPresent[studentId] = false; // Records that the student is absent.
        attendanceMarked[studentId] = true; // Distinguishes marked-absent from not-yet-marked.
    }

    function checkAttendance(uint256 studentId)
        public view returns (bool marked, bool present)
    {
        // view means this function reads the mappings but does not modify them.
        // Returns two bool values: first whether marked, then whether present.
        return (attendanceMarked[studentId], isPresent[studentId]);
        // (false,false) = not marked; (true,false) = marked absent;
        // (true,true) = marked present.
    }
}
