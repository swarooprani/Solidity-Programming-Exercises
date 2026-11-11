# Quiz answers

**1. Should assert validate an ordinary user-entered score?**

Use require or a custom error for expected invalid input. Assert is for internal invariants.

**2. Does a reverted transaction preserve its emitted logs?**

No. Logs from reverted execution are discarded.

**3. Can another contract simply read your past events as storage?**

No. Keep contract-readable data in state; events primarily serve off-chain consumers.

**4. Is all spent gas refunded when a call reverts?**

No. Reversion does not undo the computation already performed.

[Back to lesson](README.md)
