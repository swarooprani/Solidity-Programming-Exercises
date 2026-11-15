# A simple testing checklist

All examples in this repository are intended for **Remix VM**. The repository does not require npm, Hardhat, Foundry, a wallet, or a public network.

For each exercise:
1. Deploy a **fresh** instance and verify initial values.
2. Run at least one **normal** input.
3. Try **boundary** inputs (0, maximum allowed, exactly at a threshold).
4. Try an **invalid** input and check that it reverts when specified.
5. Verify the contract's stored values did not change after a reverted call.
6. When relevant, switch Remix accounts to check **access restrictions**.
7. Deploy a second instance to check that its storage is independent.

| Program | Suggested cases |
|---|---|
| Student Grade Calculator | 0/0/0; 100/100/100; one mark 101 (revert) |
| Electricity Bill | 0, 100, 101, 200, 201, 250 |
| Age Category | 12, 13, 19, 20, 59, 60 |
| Library | issue when available; return after issue; return when none issued (revert) |
| Inventory | add 0 (revert); sell exactly stock; sell more than stock (revert) |
| Attendance | unmarked ID; marked absent; marked present |
| Salary | owner updates; other account rejected; zero salary rejected |
| Quiz | 0, 10, 20, 21; nonexistent ID; non-owner writes |
| Registration | first registration; duplicate; 50 distinct addresses; over-capacity |

These are **manual learning checks**, not proof of production security.