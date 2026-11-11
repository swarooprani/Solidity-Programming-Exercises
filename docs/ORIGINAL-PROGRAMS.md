# Where the original programs fit

All nine files were retrieved from the repository's main branch and retained without source edits in this local course draft. The previous README is in [legacy](../legacy/ORIGINAL-README.md). These programs remain useful applied examples after the corresponding concepts.

| Original program | Read after | What to examine | Next improvement |
|---|---|---|---|
| [Student grades](../01_StudentGradeCalculator.sol) | 02–03 | Stored marks, validation, integer average | Multiple records and teacher-only updates; see gradebook capstone |
| [Electricity bill](../02_ElectricityBillCalculator.sol) | 01–03 | Progressive rates and boundary calculations | Add explicit rate configuration and document units |
| [Age category](../03_AgeCategoryChecker.sol) | 03 | Ordered thresholds and pure return | Compare exercise-specific age limits; original has no 150 maximum |
| [Library](../04_LibraryBookManagement.sol) | 02–03 | Available/issued conservation | Track IDs and borrower identity; see library capstone |
| [Inventory](../05_ProductInventoryManagement.sol) | 02–04 | Positive stock operations and overselling prevention | Authorize stock updates and support product IDs |
| [Attendance](../06_AttendanceManagement.sol) | 06 | Explicitly marked absent versus never marked | Teacher-only writes and a date/session dimension |
| [Employee salary](../07_EmployeeSalaryManagement.sol) | 06,09 | Owner-only mapping writes | Separate salary records from actual payment accounting |
| [Quiz scores](../08_SimpleQuizScoreManagement.sol) | 06,09 | Existence flags and passing threshold | Course/quiz identifiers and grade-change events |
| [Event registration](../09_OnlineEventRegistration.sol) | 06,09 | Address uniqueness and capacity | Add cancellation and organizer controls; see event capstone |

## Teaching simplifications

The grade calculator, library counters, inventory and attendance allow unrestricted writes through their public functions. That makes initial concepts easy to isolate, but these are not complete authorization models. The original library does not identify individual borrowers. Salary entries are numbers, not salary payments. Anyone observing a public chain can read stored data; do not enter real private student or salary information.

The original electricity calculator does not promise that every uint256 input can be multiplied without overflow. Extremely large inputs can revert under checked arithmetic. The event contract limits addresses, not humans: one person can control several accounts.

The regression suite compiles all originals and tests representative behavior, including the original event reaching its 50-address limit. New course examples can impose different exercise-specific limits; those differences are documented in their specifications.

[Course home](../README.md)
