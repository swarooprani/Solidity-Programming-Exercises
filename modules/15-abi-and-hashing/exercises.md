# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 15.1: Typed record hash — Warm-up

Implement recordHash(uint256 id,string calldata title) returning keccak256(abi.encode(id,title)). Same inputs give the same digest. Compare it with an off-chain ABI encoder.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 15.2: Define a commitment domain — Application

Implement commitment(address user,uint256 answer,bytes32 salt) view hashing abi.encode(block.chainid,address(this),user,answer,salt). Different users or contract deployments should produce different digests for the same answer and salt.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 15.3: Single-use reveal — Challenge

Add commit(bytes32), public commitments and hasCommit mappings, plus reveal(answer,salt). Only the caller may reveal their own commitment. Reject mismatches and missing commitments; delete the commitment on success. Allow replacing an unrevealed commitment. There is no timing or reward mechanism.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
