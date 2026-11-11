# 08. Storage, memory and calldata

Prerequisite: [Previous module](../07-structs-and-enums/README.md)

## Learning outcomes

- Choose a data location for reference types.
- Predict whether an assignment copies or aliases.
- Avoid accidental persistent writes.

## Explanation

Reference types such as arrays, structs and strings use a data location. Storage normally holds persistent contract state. Memory is temporary mutable data for the current call context. Calldata is read-only input data for the current call. Value types such as uint256 parameters do not require these location annotations.

Assignment behavior depends on the source and destination locations. Copying storage to memory creates an independent copy. Assigning a local storage reference to a storage array aliases the original: editing through that reference changes state. Memory-to-memory assignment usually creates another reference to the same data rather than a deep copy. A calldata reference cannot be used to modify the input.

This distinction affects both correctness and gas. A helper that only inspects an external input can often use calldata and avoid an unnecessary copy. A function that needs to edit its own temporary array uses memory. A function updating an existing record may use a local storage reference to make the target explicit.

Always ask: where do the bytes live, is this a copy or a reference, and should the modification survive the call? Do not assume that changing a returned memory array changes contract storage. Conversely, do not treat a storage alias as a scratch copy. Use a small example and compare stored values before and after the call.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

On a fresh instance, copiedChange() → [99,20], but values(0) remains 10. Then aliasedChange() makes values(0) equal 99. The first function can be view; the second cannot.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/types.html#data-location)

[Previous module](../07-structs-and-enums/README.md) | [Course home](../../README.md) | [Next module](../09-constructors-and-modifiers/README.md)
