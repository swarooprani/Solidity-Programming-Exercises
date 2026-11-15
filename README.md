# Solidity Programming — Complete Learning Course

A **step-by-step Solidity tutorial** for learners who want more than copied smart contracts. The course teaches language concepts in a deliberate sequence, from first deployment to state, data structures, access control, contract interactions and security.

**19 ordered modules · 19 commented worked Solidity programs · 57 practice exercises · 95 quiz questions with explanations · reference solution files · 9 original commented programs.**

## Start learning

1. Open the **[Complete Topic Index (Modules 00–18)](TOPIC-INDEX.md)**. This is the authoritative sequence of lessons, prerequisites and learning checkpoints.
2. Follow the [10-minute Remix setup](GETTING-STARTED.md). **Remix VM** is all you need for practice—no wallet, npm, or real Ether.
3. Start with **[Module 00: Introduction](course/00-introduction/README.md)** and continue in order.
4. In each module: **read the detailed notes → predict → run the annotated example → modify → solve exercises → attempt quiz → check explained answers**.
5. For applied programming, attempt the [nine original exercises](EXERCISES.md) before reading their original, commented reference programs.

## Complete learning path

| Stage | Modules | What you learn |
|---|---|---|
| Getting started | [00](course/00-introduction/README.md)–[03](course/03-variables-functions/README.md) | Ethereum, contract structure, data types, variables, functions |
| Control flow | [04](course/04-operators-conditionals/README.md)–[05](course/05-loops/README.md) | Operators, decisions, validation and bounded loops |
| Data structures | [06](course/06-arrays-strings-bytes/README.md)–[09](course/09-data-locations/README.md) | Arrays, strings, bytes, mappings, structs, enums and data locations |
| Contract design | [10](course/10-access-control/README.md)–[13](course/13-interfaces-libraries/README.md) | Ownership, modifiers, events, errors, inheritance, interfaces and libraries |
| Ethereum interactions | [14](course/14-ether-payable/README.md)–[16](course/16-abi-hashing/README.md) | Wei, payable calls, external calls, encoding and hashing |
| Build and assess | [17](course/17-gas-testing-security/README.md)–[18](course/18-projects/README.md) | Gas, testing, basic security and integrated capstones |

**For the full topic-by-topic sequence and direct chapter links, see [TOPIC-INDEX.md](TOPIC-INDEX.md).**

## Consistent lesson structure

Every chapter contains six focused files, so readers can progress without getting lost:

```text
course/05-loops/
├── README.md        Detailed concept notes, syntax and run instructions
├── Example.sol      Runnable, commented worked example
├── EXERCISES.md     Warm-up, application and challenge
├── QUIZ.md          Five independent comprehension questions
├── ANSWERS.md       Explained quiz answers and exercise guidance
└── Solutions.sol    Reference implementation to inspect afterwards
```

The answer files are deliberately separate so that learners can attempt the problems independently.

## Your original nine programs are preserved

These original root-level Solidity files remain **unchanged** and are incorporated into the learning journey through the [practice sheet](EXERCISES.md) and [exercise-to-topic map](ORIGINAL-PROGRAMS-GUIDE.md). They are commented reference implementations—not replacements for the new guided examples.

| Original practice contract | Suggested stage |
|---|---|
| [01 Student Grade Calculator](01_StudentGradeCalculator.sol) | Modules 03–04 |
| [02 Electricity Bill Calculator](02_ElectricityBillCalculator.sol) | Module 04 |
| [03 Age Category Checker](03_AgeCategoryChecker.sol) | Module 04 |
| [04 Library Book Management](04_LibraryBookManagement.sol) | Modules 04–05 |
| [05 Product Inventory Management](05_ProductInventoryManagement.sol) | Modules 04 and 10 |
| [06 Attendance Management](06_AttendanceManagement.sol) | Module 07 |
| [07 Employee Salary Management](07_EmployeeSalaryManagement.sol) | Module 10 |
| [08 Simple Quiz Score Management](08_SimpleQuizScoreManagement.sol) | Modules 10–11 |
| [09 Online Event Registration](09_OnlineEventRegistration.sol) | Modules 10 and 18 |

## How to check progress

After each topic, explain its syntax, predict what a sample function returns, run the example in Remix, test a boundary and failure case, then solve a related problem without the reference code. The [manual testing guide](TESTING.md) helps you check the nine original programs.

## Official references and safety

[Solidity language documentation](https://docs.soliditylang.org/) · [Remix IDE](https://remix.ethereum.org/) · [Ethereum developer docs](https://ethereum.org/en/developers/docs/)

This is an educational course, **not an audit or a production deployment guide**. Use Remix VM and simulated assets; never send real Ether to practice contracts. On-chain data is generally observable, including state variables declared private.

**[Open the complete course index](TOPIC-INDEX.md)** · **[Begin Module 00](course/00-introduction/README.md)**
