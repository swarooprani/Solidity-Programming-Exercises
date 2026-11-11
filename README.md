# Solidity Programming Exercises — Learn Step by Step

A guided course for learners who want to understand Solidity, write small programs, test their reasoning and build complete practice contracts.

**18 topic modules · 54 exercises · 72 quiz questions · 3 capstones · 9 original programs**

Start with a browser and [Remix](https://remix.ethereum.org/). You do not need a funded wallet. Basic programming familiarity helps; the [glossary](docs/GLOSSARY.md) explains the vocabulary used here.

## Start here

1. Follow the [Remix setup and first-run guide](docs/GETTING-STARTED.md).
2. Begin with [module 00](modules/00-start-here/README.md) and follow the next links.
3. For each module: read → predict → run → modify → solve → quiz → explain.
4. Finish with the [three capstone projects](projects/README.md).

Browse the [complete exercise index](docs/EXERCISE-INDEX.md).

Prefer a schedule? Use the [eight-week study plan and progress tracker](docs/STUDY-PLAN.md).

## Course map

| Module | Topic | Exercises | Quiz questions |
|---|---|---:|---:|
| 00 | [Blockchain, Solidity and your first contract](modules/00-start-here/README.md) | 3 | 4 |
| 01 | [Value types, units and operators](modules/01-types-and-operators/README.md) | 3 | 4 |
| 02 | [Variables, functions and visibility](modules/02-variables-and-functions/README.md) | 3 | 4 |
| 03 | [Decisions and input validation](modules/03-conditionals/README.md) | 3 | 4 |
| 04 | [Arrays, strings and bytes](modules/04-arrays-strings-and-bytes/README.md) | 3 | 4 |
| 05 | [For, while and do-while loops](modules/05-loops/README.md) | 3 | 4 |
| 06 | [Mappings and explicit existence](modules/06-mappings/README.md) | 3 | 4 |
| 07 | [Structs, enums and state machines](modules/07-structs-and-enums/README.md) | 3 | 4 |
| 08 | [Storage, memory and calldata](modules/08-data-locations/README.md) | 3 | 4 |
| 09 | [Constructors, modifiers and access control](modules/09-constructors-and-modifiers/README.md) | 3 | 4 |
| 10 | [Errors, reverts and events](modules/10-errors-and-events/README.md) | 3 | 4 |
| 11 | [Inheritance and overriding](modules/11-inheritance/README.md) | 3 | 4 |
| 12 | [Interfaces, libraries and composition](modules/12-interfaces-and-libraries/README.md) | 3 | 4 |
| 13 | [Ether, payable functions and withdrawals](modules/13-ether-and-payable/README.md) | 3 | 4 |
| 14 | [External calls, low-level calls and try/catch](modules/14-contract-calls/README.md) | 3 | 4 |
| 15 | [ABI encoding, hashing and commitments](modules/15-abi-and-hashing/README.md) | 3 | 4 |
| 16 | [Gas, pagination and bounded processing](modules/16-gas-and-batching/README.md) | 3 | 4 |
| 17 | [Testing behavior and security properties](modules/17-testing-and-security/README.md) | 3 | 4 |

## What each topic contains

```text
modules/05-loops/
├── README.md       # Explanation, outcomes, trace, prerequisites and references
├── examples.sol    # Commented working examples
├── exercises.md    # Warm-up, application and challenge specifications
├── solutions.sol   # Runnable reference solutions
├── solutions.md    # Expected behavior and why the solutions work
├── quiz.md         # Four questions to answer independently
└── answers.md      # Answers with explanations
```

Exercises specify inputs, outputs, edge cases and rejection rules. Work in your own file before opening the solution. An exercise can build on the previous one, so deploy the combined reference contract when following its solution.

## Your original programs

The nine original Solidity files remain at their original root paths. The [original-program learning guide](docs/ORIGINAL-PROGRAMS.md) places each in the course and documents simplifications. The previous README is preserved in [legacy/ORIGINAL-README.md](legacy/ORIGINAL-README.md).

## Optional local validation

Maintainers and learners comfortable with Node.js can run:

```sh
npm ci
npm run check
```

This checks local file links, compiles every Solidity file, and executes behavior tests on an isolated local EVM. See [testing and coverage](docs/TESTING.md) for requirements and limits. No RPC URL, private key or public-chain transaction is needed.

The reproducible validation baseline is Solidity **0.8.30**, optimizer **200 runs**, EVM **Shanghai**. Source pragmas permit compatible 0.8.x compilers starting at 0.8.20. This is a tested course baseline, not a claim that 0.8.30 is the latest compiler. Check current official compiler guidance before production work.

## Scope and next steps

This course covers Solidity foundations through introductory contract interactions, gas-aware design and security testing. It does not claim to cover every language feature or production engineering requirement. Token standards, signatures, fuzzing frameworks, upgrades and assembly are organized in the [advanced roadmap](docs/ROADMAP.md).

All contracts are educational. In particular, deposit-only examples have no withdrawal method, wallet addresses are not verified identities, and public-chain storage is not private. Use simulated assets in Remix VM.

## Contributing

Use the [contribution guide](CONTRIBUTING.md) and [lesson template](templates/LESSON-TEMPLATE.md). A good contribution adds an explanation, a runnable example, precisely specified practice, answers and meaningful checks together. See the [maintainer guide](docs/MAINTAINERS.md) for review and release steps.

Code and course text use the [MIT license](LICENSE). Original programs retain their existing SPDX notices.
