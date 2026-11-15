# Module 16 — Explained answers

### 1. What is the ABI for?

**Answer:** Encoding and decoding interactions with contracts.

### 2. What does keccak256 return?

**Answer:** A bytes32 hash.

### 3. Why avoid packed encoding of multiple dynamic inputs?

**Answer:** Distinct inputs can produce the same concatenation.

### 4. Does hashing encrypt information?

**Answer:** No; attackers can check guesses.

### 5. Is block.timestamp secure randomness?

**Answer:** No.

## Practice solutions
The commented [Solutions.sol](Solutions.sol) gives a reference implementation for part of the programming practice. Open it only after testing your approach. Discussion questions demand reasoning about failure cases, not just executable code. Compare requirements and boundary behaviors rather than exact style.

[Lesson](README.md) · [Exercises](EXERCISES.md)