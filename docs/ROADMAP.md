# Advanced learning roadmap

The foundational course is implemented in modules 00–17. The following are future tracks, not missing files or completed lessons. Add each using the same explanation/example/exercise/quiz/test standard.

| Track | Topics | Suggested outcome |
|---|---|---|
| Language depth | Function overloading, function types, custom value types, user-defined operators, tuples and destructuring | A typed unit-conversion library |
| Inheritance depth | Multiple inheritance, linearization, abstract hooks and constructor ordering | Trace an override chain with tests |
| Storage depth | Slot layout, packing, dynamic storage layout and transient storage | Explain a measured storage layout |
| Token standards | ERC-20, ERC-721, ERC-1155, approvals and safe receiver callbacks | Use maintained libraries and test permissions |
| Signatures | ECDSA recovery, EIP-712, nonces, replay protection and contract signatures | Signed action valid in only one domain |
| Calls and ABI depth | fallback/receive routing, selectors, staticcall, delegatecall and encoding pitfalls | Trace context and storage effects |
| Testing depth | Foundry or a maintained Hardhat setup, fuzzing, invariant testing, coverage and fork tests | Reproduce an accounting bug and fix it |
| Security depth | Reentrancy variants, oracle assumptions, front-running, denial of service and MEV | A documented threat model and attack regression |
| Design patterns | Escrow, pull payments, auctions, state machines, multisig and timelocks | A bounded workflow with explicit failure policy |
| Upgradeability | Proxies, initializers, storage compatibility and governance | Demonstrate a safe and unsafe layout change |
| Advanced deployment | CREATE2, factories, bytecode verification and chain configuration | Reproducible deployment with no exposed secrets |
| Assembly | Yul, memory safety and ABI internals | Justify one carefully bounded optimization |
| Dapp integration | Wallet connection, chain selection, transaction receipts and event indexing | A small interface with clear pending/failure states |
| Operations | Compiler security advisories, dependencies, release checks and incident response | Document ownership and maintenance procedures |

Start advanced work from current [Solidity documentation](https://docs.soliditylang.org/) and the official documentation of the selected framework or standard. Pin versions and record the environment that was actually tested.

[Course home](../README.md)
