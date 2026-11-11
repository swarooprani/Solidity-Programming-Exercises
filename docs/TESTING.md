# Local checks and what they establish

The browser learning path does not require Node.js. These checks are for maintaining the reference material and for learners ready to automate their test cases.

## Run

Install Node.js 22 or newer, open a terminal in the repository directory, then run:

```sh
npm ci
npm run check
```

On Windows PowerShell, use `npm.cmd` if execution policy blocks the npm.ps1 wrapper. No public RPC, private key, mnemonic or .env file is needed. First-time dependency installation requires internet access. Compilation and tests then use the installed local packages.

Individual commands:

| Command | Purpose |
|---|---|
| npm run check:links | Check local Markdown file-link targets |
| npm run compile | Compile all Solidity source files |
| npm test | Compile fresh bytecode and run all EVM behavior groups |
| npm run check | Check links, then compile and run behavior groups |

## Compiler settings

- solc-js 0.8.30, pinned in package.json and package-lock.json.
- Optimizer enabled, 200 runs.
- Shanghai EVM target, matched to the local runner.
- Output: build/contracts.json and build/compile-summary.json.
- All root originals, module files, project files and test helpers are included.

## Behavior checks

The suite executes deployed bytecode through ethers on a local Ganache provider. It covers:

- Every module's example and solution contracts with representative acceptance cases.
- All three capstone references.
- All nine original programs.
- Normal results, important boundaries, empty/default values and invalid requests.
- Unauthorized accounts, ownership changes, state transitions and decoded events.
- A forced mined revert, with unchanged state and discarded logs.
- A receiver that rejects Ether and a receiver that attempts nested withdrawal.
- Thirty deterministic generated transfers with conservation checked after each step.
- Original registration at exactly 50 users and rejection of a 51st user.

The 28 named groups each contain multiple assertions. They are not a claim of 100% statement or branch coverage, exhaustive input testing, or a security audit. The generated transfer sequence is deterministic, not a general fuzzing framework. The file-link checker does not validate external URLs or Markdown fragment anchors.

## Runner limitations

Ganache 7.9.2 is a pinned legacy regression dependency; its [upstream repository is archived](https://github.com/ConsenSys-archive/ganache). It is used only for isolated local execution, not presented as the recommended production framework. A portable JavaScript networking fallback is selected by the suite. No server is exposed to the network.

The suite creates temporary EVM database files under ignored build/tmp instead of relying on the operating system's temporary folder. Test accounts have simulated balances and are discarded when the process ends. Test private keys are never exported.

Future maintainers should move the regression runner to a maintained EVM/testing framework as a separate change, preserving these behavior tests. Before changing compiler or EVM versions, check their compatibility and rerun the suite.

Test results are written to build/test-summary.json. See [VALIDATION.md](VALIDATION.md) for the delivered snapshot's observed results.

[Course home](../README.md)
