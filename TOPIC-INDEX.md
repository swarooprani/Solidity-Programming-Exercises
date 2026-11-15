# Complete Solidity Course — Topic Index

**Audience:** learners with basic programming knowledge, including those new to blockchain.  
**Learning order:** follow modules **00 → 18**. Each module builds on the previous one.  
**Practice environment:** [Remix IDE](https://remix.ethereum.org/) with **Remix VM** (simulated funds, no public deployment).

## Ordered syllabus

| # | Topic | Concepts to master | Course chapter |
|---|---|---|---|
| 00 | **Introduction, Ethereum and Remix** | Blockchain, accounts, transactions, EVM, deploy/call | [Chapter 00](course/00-introduction/README.md) |
| 01 | **Smart-contract structure** | SPDX, pragma, contract, compile, deploy, getters | [Chapter 01](course/01-contract-basics/README.md) |
| 02 | **Data types and conversions** | uint/int, bool, address, strings, bytes, literals, units, casts | [Chapter 02](course/02-data-types/README.md) |
| 03 | **Variables and functions** | state/local variables, constants, immutable, scope, visibility, pure/view | [Chapter 03](course/03-variables-functions/README.md) |
| 04 | **Operators and conditionals** | arithmetic, comparison, logic, precedence, if/else, require | [Chapter 04](course/04-operators-conditionals/README.md) |
| 05 | **Loops** | for/while/do-while, break/continue, gas-aware bounds | [Chapter 05](course/05-loops/README.md) |
| 06 | **Arrays, strings and bytes** | fixed/dynamic arrays, push/pop, indexing, UTF-8, bytes | [Chapter 06](course/06-arrays-strings-bytes/README.md) |
| 07 | **Mappings** | keys, default values, nested mappings, presence tracking | [Chapter 07](course/07-mappings/README.md) |
| 08 | **Structs and enums** | records, state machines, complex storage, custom types | [Chapter 08](course/08-structs-enums/README.md) |
| 09 | **Data locations** | storage, memory, calldata, copying versus references | [Chapter 09](course/09-data-locations/README.md) |
| 10 | **Constructors and access control** | msg.sender, owner, modifiers, role checks | [Chapter 10](course/10-access-control/README.md) |
| 11 | **Errors and events** | require/revert/assert, custom errors, logs, rollbacks | [Chapter 11](course/11-errors-events/README.md) |
| 12 | **Inheritance** | base contracts, virtual/override, abstract, super | [Chapter 12](course/12-inheritance/README.md) |
| 13 | **Interfaces and libraries** | interfaces, libraries, using for, composition | [Chapter 13](course/13-interfaces-libraries/README.md) |
| 14 | **Ether and payable** | wei/ether, msg.value, balances, withdrawals | [Chapter 14](course/14-ether-payable/README.md) |
| 15 | **External contract calls** | typed calls, low-level calls, try/catch, CEI, reentrancy | [Chapter 15](course/15-contract-calls/README.md) |
| 16 | **ABI and hashing** | abi.encode, abi.encodePacked, keccak256, collisions, signatures | [Chapter 16](course/16-abi-hashing/README.md) |
| 17 | **Gas, tests and security** | gas trade-offs, bounded processing, test strategy, threat modeling | [Chapter 17](course/17-gas-testing-security/README.md) |
| 18 | **Integrated projects** | gradebook, inventory, attendance, registration and extension tasks | [Chapter 18](course/18-projects/README.md) |

## How every chapter works

Each chapter follows the same six steps:

1. **Concept notes:** detailed explanations of the *why*, syntax, limits, and common mistakes.
2. **Worked example:** an independently compilable, carefully commented `Example.sol`; follow the trace in Remix.
3. **Check your understanding:** written questions about the explanation.
4. **Hands-on exercises:** a warm-up, an application, and a challenge with expected behavior.
5. **Quiz:** independent concept questions.
6. **Answer key:** explained answers and a reference `Solutions.sol`. Don't open these until you try.

## Learning checkpoints

| After | You should be able to |
|---|---|
| Module 05 | Write and trace small Solidity functions, conditions, and bounded loops |
| Module 09 | Model and update persistent data using arrays, mappings, records, and explicit data locations |
| Module 13 | Control access, report events, reuse contracts, and reason about inheritance and interfaces |
| Module 17 | Handle simulated Ether and external calls; identify basic security and gas risks |
| Module 18 | Build and test small integrated contracts independently |

## Original programs

The repository's [nine original commented programs](EXERCISES.md) remain unchanged at the root. Their applications are introduced after the necessary concepts, and they serve as additional reference solutions.

## Important scope

This is a **learning course**, not an audit or a production deployment guide. Use **Remix VM** and simulated balances; avoid sending real Ether to tutorial contracts. The compiler version used in examples must satisfy the specified `pragma`. For production, consult the [official Solidity documentation](https://docs.soliditylang.org/) and security specialists.

[Course home](README.md) · [Remix setup](GETTING-STARTED.md)

## Original exercises mapped to the syllabus

For a direct mapping from the nine original reference contracts to their prerequisite lessons, see [Original programs learning map](ORIGINAL-PROGRAMS-GUIDE.md). Attempt the [practice specifications](EXERCISES.md) before opening their code.
