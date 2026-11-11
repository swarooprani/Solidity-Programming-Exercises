# Run the course with Remix

## First run

1. Open [Remix IDE](https://remix.ethereum.org/).
2. Create a workspace or use a practice workspace. Create `FirstStore.sol` in its file explorer.
3. Copy [module 00 examples.sol](../modules/00-start-here/examples.sol) into the new file. Copy actual source text, not a GitHub page's HTML.
4. In **Solidity Compiler**, choose compiler 0.8.30 for the course baseline. Under advanced settings choose Shanghai as the EVM version. The source pragma also allows other compatible 0.8.x compilers, but the local checks use the stated baseline.
5. Compile the active file. Read and resolve any compiler errors.
6. Open **Deploy & Run Transactions**. Choose a **Remix VM** environment compatible with the target. Names can vary between Remix versions. This is the local practice chain with simulated accounts and balances.
7. Select `FirstStore`. Leave Value at 0. It has no constructor arguments. Click Deploy.
8. Expand the deployed instance. Read `number`: expect 0. Call `set` with 42, wait for success, then read `number` again: expect 42.
9. Deploy a second instance and confirm its number starts at 0.

## Running later lessons

Each lesson names the contract to select and gives a call sequence. A file can contain several contracts, libraries or interfaces; choose a deployable contract rather than an interface or abstract base. If a constructor takes arguments, provide them before deployment.

For contract-to-contract lessons, deploy the source/service first. Copy its deployed address and pass it to the consumer constructor. Both instances must be on the same practice chain. Resetting the VM makes earlier instance addresses stale.

To test permissions, deploy with account A, then switch the account selector to B before calling a protected function. A rejected transaction is an expected result in negative tests; verify that stored values stayed unchanged.

For Ether deposits, enter the amount and select the unit before calling a payable deposit function. The examples use wei in their test cases. Set Value back to zero before other calls. Use only simulated assets; module 13's example is deposit-only, while its solution demonstrates withdrawal.

For arrays, use input such as `[10,20,30]`. For strings, use the parameter UI and quote text where the combined input expects JSON-style strings. For addresses, use the full 0x-prefixed address.

## Troubleshooting

| Symptom | Check |
|---|---|
| Compiler rejects pragma | Selected version must satisfy ^0.8.20; use baseline 0.8.30 |
| Invalid opcode during deployment | Match compiler EVM target to the practice VM; use Shanghai baseline |
| No deploy button for a selected definition | Interfaces and abstract contracts are not deployable |
| Not owner / Not teacher | Switch to the account that deployed the instance |
| Nonpayable call rejects value | Reset Value to zero |
| Empty-array or index error | Check the length and valid zero-based indexes |
| Result belongs to an old instance | Expand the correct deployment or deploy a fresh one |
| Service call fails | Confirm the source address, chain, ABI and deployment order |

Official references: [Remix deployment guide](https://remix-ide.readthedocs.io/en/latest/run.html), [Solidity introduction](https://docs.soliditylang.org/en/v0.8.30/introduction-to-smart-contracts.html).

[Course home](../README.md)
