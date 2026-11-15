# Practice exercises — try before opening the solutions

The nine original programs are preserved at their root paths as commented **reference solutions**. Use the descriptions below to build your own solution first, then inspect the linked Solidity file.

| # | Exercise | Skills | Reference solution |
|---|---|---|---|
| 1 | Student grade calculator | Storage, validation, averages | [01](01_StudentGradeCalculator.sol) |
| 2 | Electricity bill | Progressive slabs, conditions, pure functions | [02](02_ElectricityBillCalculator.sol) |
| 3 | Age category | Comparisons, return values | [03](03_AgeCategoryChecker.sol) |
| 4 | Library book management | State, constructors, require | [04](04_LibraryBookManagement.sol) |
| 5 | Product inventory | State changes, input validation | [05](05_ProductInventoryManagement.sol) |
| 6 | Attendance management | Mappings, unset versus false | [06](06_AttendanceManagement.sol) |
| 7 | Employee salary | Ownership, modifiers, mapping | [07](07_EmployeeSalaryManagement.sol) |
| 8 | Quiz scores | Ownership, score validation, mappings | [08](08_SimpleQuizScoreManagement.sol) |
| 9 | Event registration | Addresses, capacity, duplicates | [09](09_OnlineEventRegistration.sol) |

## Beginner: 1–3
1. **Grades.** Record three marks, each within 0–100. Return the total and integer average. Test (85,90,75) → total 250, average 83; reject an input greater than 100.
2. **Electricity.** Charge 2 per unit for the first 100, 3 for the next 100, and 5 after 200. Test 0 → 0; 100 → 200; 200 → 500; 250 → 750.
3. **Age.** Return Child for 0–12, Teenager for 13–19, Adult for 20–59, and Senior Citizen for 60+. Try boundaries 12, 13, 19, 20, 59, 60.

## Intermediate: 4–6
4. **Library.** Set starting available copies in the constructor. Track both issued and available counts; reject issuing at zero and returning when none are issued.
5. **Inventory.** Set product name and initial stock. Add positive stock and sell positive amounts only when enough stock exists.
6. **Attendance.** Mark an ID present or absent. Return both whether attendance was ever marked and whether the student is present.

## Applied: 7–9
7. **Salary.** Store salaries by employee ID. Only the deployer can set a positive salary; anyone may read the stored value. Discuss public-data privacy.
8. **Quiz.** Only the deploying teacher may enter a score in 0–20. Track if an ID received a score, and determine pass at >= 10.
9. **Registration.** Allow each Ethereum address to register only once; reject registrations after 50. Show total registrations and remaining seats.

## How to check your work
For each exercise, write down: inputs, expected result, actual result, and whether a failed transaction leaves state unchanged. For ownership tasks, switch to another Remix VM account and try the restricted action.

[Back to course](README.md) · [Testing guide](TESTING.md)