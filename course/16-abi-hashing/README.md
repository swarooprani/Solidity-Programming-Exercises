# Module 16 — ABI encoding, hashing and built-ins

**Prerequisite:** Module 15 · **Tools:** [Remix](https://remix.ethereum.org/) with simulated Remix VM accounts.

## Detailed concept notes

### 1. ABI meaning

The Ethereum Application Binary Interface defines the binary format of contract function calls, return values, errors, and events. Dapps use the compiler-generated ABI to communicate with deployed bytecode.

### 2. abi.encode

abi.encode(a,b) generates standard, padded ABI encoding including information needed to keep dynamic argument boundaries unambiguous. It is a good default when building a hash over several fields.

### 3. abi.encodePacked

abi.encodePacked concatenates compact encodings. For multiple dynamic inputs, the concatenation can be ambiguous: the pairs ('ab','c') and ('a','bc') result in the same bytes. Avoid using packed encoding for security-sensitive hashes over multiple dynamic elements.

### 4. keccak256

keccak256 hashes bytes to bytes32. It does not encrypt the input or guarantee secrecy when an observer can enumerate likely input values.

### 5. Selectors and signatures

The first four bytes of the Keccak hash of a canonical function signature identify an ordinary external function selector. For example, a signature includes function name and parameter types, not parameter names.

### 6. Useful built-ins

msg.sender is the immediate caller, msg.value is wei attached to a call, block.timestamp approximates chain time, and address(this) is the current contract's address. Do not treat block.timestamp as secure randomness.

## Annotated example

Open [Example.sol](Example.sol) and read the comments. Copy it into Remix, compile with a compatible Solidity compiler, deploy the named contract (or multiple contracts for interactions) using Remix VM, and follow the trace.

**Predict and run:** Call encoded('ab','c') and encoded('a','bc'): their hashes differ. Call packed with those pairs: the hashes match because the packed byte streams are identical.

## Explain in your own words

1. What is the ABI for?
2. What does keccak256 return?
3. Why avoid packed encoding of multiple dynamic inputs?

## Practice and review

[Exercises](EXERCISES.md) · [Quiz](QUIZ.md) · [Explained answers](ANSWERS.md) · [Reference solutions](Solutions.sol)

[← Previous](../15-contract-calls/README.md) · [Course index](../../TOPIC-INDEX.md) · [Next →](../17-gas-testing-security/README.md)

> Learning examples only. Not security audited; do not use real Ether.