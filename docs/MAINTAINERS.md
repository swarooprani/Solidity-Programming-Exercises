# Maintainer guide

## Editorial standard

Keep one concept primary in each early example. Introduce dependencies in prerequisite order. If an early example uses a later concept incidentally, explain the minimum needed and link to the later topic. Use comments to explain why a check or assignment exists. Describe units, state changes and caller permissions explicitly.

Each module needs outcomes, theory, runnable example(s), a trace, three progressive exercises, a separate reference implementation, four quiz questions and explanations. Every practice problem must define accepted inputs, outputs, invalid behavior and at least one boundary. Preserve root original-program paths when adding the course to the existing repository.

## Review a contribution

1. Verify the behavior specification independently of the implementation.
2. Compile all Solidity files using the pinned configuration.
3. Check meaningful behavior tests, including rejected actions preserving state.
4. Run the local file-link check.
5. Manually review lesson order, expected outputs, quiz answers and comments.
6. Confirm that educational simplifications and unimplemented extensions are labeled.

Do not test only a single happy-path input. When fixing a bug, add a case reproducing the actual failure rather than a test that simply repeats the implementation.

## Development workflow

Work in a checkout of Solidity-Programming-Exercises on a new branch, preserving the existing Git history. The nine original root .sol files are retained; the root README is the course home, and its original text is kept in legacy/ORIGINAL-README.md. Review the diff, run npm ci and npm run check, then open a pull request. Do not upload node_modules or build.

The [CI configuration template](../templates/COURSE-CHECKS.yml) can be copied to .github/workflows/check.yml by a maintainer with workflow-write permission. Once enabled, it runs on push and pull requests with a read-only repository token; no deployment keys are needed. The publishing login did not include workflow-write permission, so the course upload includes this template rather than an active workflow. The course does not deploy contracts or publish a site.

## Version maintenance

The course baseline is pinned for reproducibility, not advertised as the latest release. Periodically review official compiler advisories and tool maintenance status. Update compiler, EVM target, lockfile, test runner and README version information together when needed. Ganache is archived; migrating that local runner is an explicit follow-up in the advanced tooling track.

For production-oriented additions, document chain assumptions and use maintained standard libraries. Separate audited library usage from hand-built pedagogical simplifications. Never place secrets or real student records in examples.

[Course home](../README.md)

## Lockfile portability

If you regenerate package-lock.json with npm install, run `npm run normalize-lock` before committing it. Ganache's shrinkwrap can leak extraneous development-only packages into the consumer lock, including a macOS-only watcher. The normalization removes only entries explicitly marked extraneous beneath Ganache; actual runtime dependencies and bundled entries remain intact. This is a narrow compatibility fix for the pinned legacy runner. Verify a clean npm ci after changing dependencies.
