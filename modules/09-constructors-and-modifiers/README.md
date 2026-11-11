# 09. Constructors, modifiers and access control

Prerequisite: [Previous module](../08-data-locations/README.md)

## Learning outcomes

- Initialize configuration once at deployment.
- Apply reusable caller checks.
- Test authorized and unauthorized accounts.

## Explanation

A constructor executes once when an instance is deployed. It can validate initial parameters and save configuration. The deployed runtime code does not expose the constructor as a function that can be called again. If a factory deploys a contract, msg.sender during construction is the factory, not automatically the human who called the factory.

A modifier wraps a function body. The `_ ;` placeholder marks where that body executes. A common modifier checks that msg.sender equals a stored owner. A modifier is only as strong as its conditions and its use: every privileged write path must be protected. A private variable alone does not enforce who may call a setter.

Use `immutable` for configuration assigned during construction and never changed afterward. Use ordinary state for values intended to change. Ownership transfer requires its own policy. Reject the zero address if transferring there would permanently disable required administration. For production, established access-control libraries and a two-step ownership handover are often appropriate.

Use msg.sender for immediate-caller authorization, not tx.origin. When testing, deploy from account A, verify that A can act, and switch to B to confirm rejection. After ownership transfer, test both the new and old owner. Calling through another contract changes the immediate sender, which matters when integrating systems.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Deploy from A with initialLimit 5. A calls setLimit(8) successfully. Switch to B: setLimit(10) reverts and limit remains 8. owner cannot be reassigned because it is immutable.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/contracts.html#constructors)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/security-considerations.html#tx-origin)

[Previous module](../08-data-locations/README.md) | [Course home](../../README.md) | [Next module](../10-errors-and-events/README.md)
