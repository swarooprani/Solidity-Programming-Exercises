# 10. Errors, reverts and events

Prerequisite: [Previous module](../09-constructors-and-modifiers/README.md)

## Learning outcomes

- Choose require, custom errors and assert.
- Observe transaction rollback.
- Emit and inspect structured logs.

## Explanation

A failed precondition should reject the call. `require(condition, "reason")` is convenient for input validation. A custom error defines a named failure with typed arguments; `revert ErrorName(...)` reports it. `assert` expresses an internal invariant that should hold if the implementation is correct, rather than ordinary invalid user input.

A revert rolls back state changes and logs in the reverted call and its reverted subcalls. If the whole transaction reverts, its application state changes are undone, but gas already spent is not returned as though nothing happened. If a caller deliberately catches an external failure, the caller may continue; module 14 explores this boundary.

Events produce logs for off-chain applications to consume. Declare the event, then emit it when the relevant action succeeds. Indexed fields are placed in topics for filtering; dynamic indexed values are represented by a hash rather than their original text. Logs are not a substitute for state that contracts need to read later. A reverted action does not leave a successful event log behind.

Include enough context for an observer to understand what changed, such as caller, record ID, old value and new value. Avoid misleading events emitted for actions that did not happen. Test state and logs together: a correct value with a wrong event can still break an application that follows those logs.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

set(25) succeeds and emits ValueChanged(caller,0,25). set(101) reverts with TooLarge(101,100); value remains 25 and no ValueChanged log from that failed call survives.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/control-structures.html#error-handling-assert-require-revert-and-exceptions)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/contracts.html#events)

[Previous module](../09-constructors-and-modifiers/README.md) | [Course home](../../README.md) | [Next module](../11-inheritance/README.md)
