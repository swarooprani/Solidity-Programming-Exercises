# Learn Solidity — Step by Step

A beginner-friendly Solidity course built around **9 original hands-on exercises**. Start in your browser with [Remix IDE](https://remix.ethereum.org/), read one short lesson at a time, run the example, then solve the exercise.

**No paid tools, wallet, real ETH, Node.js setup, or previous blockchain experience required.** Basic programming familiarity is helpful.

## Start here

1. [Set up Remix and deploy your first contract](GETTING-STARTED.md).
2. Work through the lessons below **in order**.
3. After each lesson: **read → predict → run → modify → practice**.
4. Attempt the [9 practice problems](EXERCISES.md) **before opening their reference code**.
5. Use the [manual testing checklist](TESTING.md) to check your work.

## Course roadmap

| Section | Lessons |
|---|---|
| **1. Foundations** | [01 First contract](lessons/01-foundations/01-what-is-solidity.md) · [02 Values and functions](lessons/01-foundations/02-values-and-functions.md) · [03 Conditions](lessons/01-foundations/03-conditions-and-validation.md) |
| **2. Working with state** | [04 State and constructors](lessons/02-working-with-state/04-state-constructors.md) · [05 Arrays and loops](lessons/02-working-with-state/05-arrays-and-loops.md) · [06 Mappings and structs](lessons/02-working-with-state/06-mappings-and-structs.md) |
| **3. Contract behavior** | [07 Access control](lessons/03-contract-behavior/07-accounts-access-control.md) · [08 Events and errors](lessons/03-contract-behavior/08-events-errors.md) · [09 Event registration](lessons/03-contract-behavior/09-registration-project.md) |
| **4. Next steps** | [10 Ether and safety](lessons/04-next-steps/10-ether-and-safety.md) · [11 Testing](lessons/04-next-steps/11-testing-and-review.md) · [12 What's next](lessons/04-next-steps/12-where-to-go-next.md) |

## Original exercises and reference solutions

The nine original `.sol` files remain **unchanged at the root of the repository**. They contain explanatory comments and serve as reference solutions. The [exercise sheet](EXERCISES.md) gives you the problems first.

| # | Program | Source |
|---|---|---|
| 01 | Student Grade Calculator | [View](01_StudentGradeCalculator.sol) |
| 02 | Electricity Bill Calculator | [View](02_ElectricityBillCalculator.sol) |
| 03 | Age Category Checker | [View](03_AgeCategoryChecker.sol) |
| 04 | Library Book Management | [View](04_LibraryBookManagement.sol) |
| 05 | Product Inventory Management | [View](05_ProductInventoryManagement.sol) |
| 06 | Attendance Management | [View](06_AttendanceManagement.sol) |
| 07 | Employee Salary Management | [View](07_EmployeeSalaryManagement.sol) |
| 08 | Simple Quiz Score Management | [View](08_SimpleQuizScoreManagement.sol) |
| 09 | Online Event Registration | [View](09_OnlineEventRegistration.sol) |

## How to run a reference program

Open [Remix](https://remix.ethereum.org/), create a `.sol` file, paste the source from its link, compile using a compatible Solidity **0.8.x version (>=0.8.20)**, and deploy under **Remix VM**. Expand the deployed contract to call its functions. See [the step-by-step setup](GETTING-STARTED.md).

> **Safety:** Tutorial contracts are for learning, not deployment with real assets. Blockchain records are not private just because access to a function is restricted. This course does not constitute a security audit.

## Reference documentation

[Solidity](https://docs.soliditylang.org/) · [Remix](https://remix-ide.readthedocs.io/) · [Ethereum developer docs](https://ethereum.org/en/developers/docs/)

**Ready?** [Start with Lesson 01](lessons/01-foundations/01-what-is-solidity.md).
