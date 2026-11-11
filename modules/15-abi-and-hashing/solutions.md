# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 15.1: Typed record hash

Implement recordHash(uint256 id,string calldata title) returning keccak256(abi.encode(id,title)). Same inputs give the same digest. Compare it with an off-chain ABI encoder.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 15.2: Define a commitment domain

Implement commitment(address user,uint256 answer,bytes32 salt) view hashing abi.encode(block.chainid,address(this),user,answer,salt). Different users or contract deployments should produce different digests for the same answer and salt.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 15.3: Single-use reveal

Add commit(bytes32), public commitments and hasCommit mappings, plus reveal(answer,salt). Only the caller may reveal their own commitment. Reject mismatches and missing commitments; delete the commitment on success. Allow replacing an unrevealed commitment. There is no timing or reward mechanism.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** abi.encode preserves the tuple structure before hashing. Compare the exact types with an off-chain encoder, not only string concatenation.

**Exercise 2.** Including chain, contract and user separates domains, making an otherwise identical preimage different across those contexts.

**Exercise 3.** The existence flag handles any bytes32 digest. A successful reveal clears it, preventing reuse; a failed match leaves it intact.
