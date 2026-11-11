# 07. Structs, enums and state machines

Prerequisite: [Previous module](../06-mappings/README.md)

## Learning outcomes

- Group related fields into a struct.
- Name a limited set of states with an enum.
- Enforce legal state transitions.

## Explanation

A struct groups fields into one record. A book might have a title, borrower and availability status. A mapping from ID to struct provides direct lookup. An array of structs gives ordered records. Missing mapping records still contain default values, so include an existence flag if those defaults might also describe a real record.

An enum names a finite set of alternatives. In `enum Status { Draft, Active, Closed }`, the first member has numeric value zero and is the default. Enums make code more readable than unexplained integer codes. A value being a valid enum member does not prove that changing to it is allowed.

A state machine defines which transitions are legal. A task might move Pending → Done and never back. Check the current state before writing the next state. Do not expose an unrestricted generic setter if it bypasses those rules. Write a transition table before implementing a multi-stage workflow.

A storage reference to a struct changes the original record when assigned through it. A memory copy is temporary. Module 08 explores that distinction in detail. Avoid putting real personal data in these practice records: public-chain data is visible even when fields are private. IDs and synthetic text are enough to learn the technique.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

add("Read loops") creates task 0 with status 0 (Pending). complete(0) changes it to status 1 (Done). A second completion reverts. An invalid array index also reverts.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/types.html#structs)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/common-patterns.html#state-machine)

[Previous module](../06-mappings/README.md) | [Course home](../../README.md) | [Next module](../08-data-locations/README.md)
