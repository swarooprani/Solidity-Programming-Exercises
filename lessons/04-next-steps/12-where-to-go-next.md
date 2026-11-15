# 12. Your next Solidity learning steps

**Level:** Next steps · **Time:** about 20–40 minutes

## What you'll learn
You now have the foundations for reading small smart contracts. Continue with interfaces, libraries, inheritance, errors, low-level calls, token standards, testing frameworks, and security—but learn them one at a time instead of mixing them into your first exercises.

## Understand it
Recommended references: the [Solidity documentation](https://docs.soliditylang.org/), [Remix documentation](https://remix-ide.readthedocs.io/), and [OpenZeppelin Contracts](https://docs.openzeppelin.com/contracts/). Production security requires far more than compiling a tutorial.

## Try this in Remix
1. Create `12-where-to-go-next.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// Learning progression:
// 1. Rebuild one original exercise without looking at the answer
// 2. Add tests for boundary and failure cases
// 3. Add a new requirement and justify any access control
// 4. Learn established libraries and independent security review
```

**Check:** Choose one original program and rewrite its specification in your own words before reading the source. Then implement and compare.

## Your turn
Build a small gradebook that stores scores for multiple student IDs. Plan how to distinguish missing scores from zero scores, and decide who is authorized to write.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../04-next-steps/11-testing-and-review.md) · [All lessons](../../README.md) · [Course home](../../README.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
