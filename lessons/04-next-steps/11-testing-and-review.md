# 11. Testing behavior and reviewing contracts

**Level:** Next steps · **Time:** about 20–40 minutes

## What you'll learn
Compiling proves that Solidity accepts your code; it does not prove that your requirements are satisfied. Tests should cover normal inputs, boundaries, invalid inputs, access restrictions, and repeated operations.

## Understand it
Use a predictable order: deploy fresh, establish initial state, perform an action, check the expected state, and test rejection paths. Remix VM lets you switch simulated accounts and deploy fresh instances to test permissions.

## Try this in Remix
1. Create `11-testing-and-review.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// Test checklist (manual, for Remix VM):
// [ ] New deployment has expected initial state
// [ ] Valid input produces expected output
// [ ] Boundary input is handled correctly
// [ ] Invalid input reverts when required
// [ ] State is unchanged after a failed call
// [ ] Unauthorized account cannot perform restricted action
```

**Check:** For the grade calculator, test marks (0,0,0), (100,100,100), and an invalid mark 101. For inventory, test selling exactly the remaining stock and selling one more than available.

## Your turn
Write a five-case test table for any original exercise. Include expected output/state, actual result, and whether the case passed.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../04-next-steps/10-ether-and-safety.md) · [All lessons](../../README.md) · [Next →](../04-next-steps/12-where-to-go-next.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
