# Original programs — where they fit in the course

The nine root-level `.sol` files are the original solutions and are deliberately left unchanged. Each is a useful way to apply concepts after reading the corresponding detailed chapter. Before opening the solution file, follow the prompt in [EXERCISES.md](EXERCISES.md).

| Program | First relevant course chapters | What to practice | Suggested tests |
|---|---|---|---|
| [01 Grade Calculator](01_StudentGradeCalculator.sol) | [03 Variables and functions](course/03-variables-functions/README.md), [04 Conditions](course/04-operators-conditionals/README.md) | State, validation, arithmetic, integer averages | 0/0/0; 85/90/75; 100/100/100; mark 101 rejected |
| [02 Electricity Bill](02_ElectricityBillCalculator.sol) | [04 Conditions](course/04-operators-conditionals/README.md) | Progressive slabs, bounds and pure functions | 0, 100, 101, 200, 250 |
| [03 Age Category](03_AgeCategoryChecker.sol) | [04 Conditions](course/04-operators-conditionals/README.md) | Branch order, comparison operators | 12, 13, 19, 20, 59, 60 |
| [04 Library Books](04_LibraryBookManagement.sol) | [03 Variables](course/03-variables-functions/README.md), [04 Validation](course/04-operators-conditionals/README.md) | Constructors, tracked counts and reverts | Issue until empty; invalid issue; valid/invalid return |
| [05 Inventory](05_ProductInventoryManagement.sol) | [04 Validation](course/04-operators-conditionals/README.md) | Input constraints and stock invariants | Add 0; sell exactly available; oversell |
| [06 Attendance](06_AttendanceManagement.sol) | [07 Mappings](course/07-mappings/README.md) | Mapping defaults, presence flags | Unmarked; marked absent; marked present |
| [07 Salaries](07_EmployeeSalaryManagement.sol) | [10 Access control](course/10-access-control/README.md) | Owners, modifiers, authorization | Owner writes; non-owner rejection; zero salary |
| [08 Quiz Scores](08_SimpleQuizScoreManagement.sol) | [07 Mappings](course/07-mappings/README.md), [10 Access control](course/10-access-control/README.md) | Scores, ownership, mapping existence | Score 0,10,20,21; non-owner write |
| [09 Event Registration](09_OnlineEventRegistration.sol) | [10 Access control](course/10-access-control/README.md), [18 Projects](course/18-projects/README.md) | Address keys, capacity and duplicates | First registration; duplicate; full event |

## How to learn from an existing solution

1. Read only the task requirements in [EXERCISES.md](EXERCISES.md).
2. Write your own contract in a new Remix file.
3. Predict the results, then test expected behavior and invalid inputs.
4. Open the original program and compare its comments, logic and validation with yours.
5. Improve your implementation and explain why it is safe under the given requirements.

Some originals are intentionally small teaching exercises rather than production systems. For example, their public-chain data is not confidential, and a numeric ID does not verify a person.

[Course index](TOPIC-INDEX.md) · [Course home](README.md)
