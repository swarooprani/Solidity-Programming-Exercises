# Delivered snapshot validation

Observed on 11 November 2026, Windows, Node.js 24.12.0:

| Check | Observed result |
|---|---|
| Solidity compilation | 49 source files, 65 contract/interface/library definitions, zero warnings |
| Compiler | 0.8.30+commit.73712a01.Emscripten.clang |
| Settings | Optimizer enabled, 200 runs, Shanghai EVM target |
| Runtime behavior | 28/28 test groups passed |
| Local Markdown file links | 435 checked, zero broken |
| Fresh installation | npm ci succeeded in a separate clean directory; full npm run check then passed |
| Original source preservation | All nine root .sol files match the GitHub Git blob hashes byte for byte |

The runtime groups cover module examples/solutions, capstones and originals. They include expected reverts, event decoding, a mined rollback, hostile Ether receivers, capacity and batching limits, and a 30-transfer conservation sequence. See [TESTING.md](TESTING.md) for what these checks do and do not establish.

The machine-readable [validation results](validation-results.json) list all 28 groups. The [GitHub Actions configuration template](../templates/COURSE-CHECKS.yml) is included for maintainers to enable; it was not run on GitHub for this validation snapshot.

## Repository source reviewed

Original repository: [swarooprani/Solidity-Programming-Exercises](https://github.com/swarooprani/Solidity-Programming-Exercises).

Reviewed main-branch head: [6131328a651e8d2526174f7783b38757f6d991d6](https://github.com/swarooprani/Solidity-Programming-Exercises/commit/6131328a651e8d2526174f7783b38757f6d991d6).

Original README is preserved under legacy; the root README becomes the course entry point. This validation snapshot was taken locally before GitHub publication.

## Reproduce

Run npm ci, then npm run check. Compiler artifacts and machine-readable test results are generated under ignored build/. They are excluded from the distribution archive along with node_modules. The archive includes the lockfile and all source/check scripts.

[Course home](../README.md)
