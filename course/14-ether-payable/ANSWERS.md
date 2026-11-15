# Module 14 — Answers and reasoning

### 1. How many wei are in one ether?

**Answer:** 10^18 wei.

### 2. What does msg.value represent?

**Answer:** The amount of wei attached to the call.

### 3. Why update credit before the payout?

**Answer:** To prevent a callback from observing or reusing the old credit.

### 4. What does address(this).balance mean?

**Answer:** The contract's current native Ether balance.

### 5. Should you send real ETH to these examples?

**Answer:** No. Use Remix VM simulated funds.

## Exercise review
The worked [Solutions.sol](Solutions.sol) demonstrates one reference implementation. Compare inputs, required restrictions, storage changes and boundary behavior with your own version. The discussion challenges require a written explanation, not just a Solidity file.

[Exercises](EXERCISES.md) · [Lesson](README.md)