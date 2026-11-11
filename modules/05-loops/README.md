# 05. For, while and do-while loops

Prerequisite: [Previous module](../04-arrays-strings-and-bytes/README.md)

## Learning outcomes

- Trace all three loop forms.
- Use break, continue and return correctly.
- Bound execution and avoid off-by-one errors.

## Explanation

A loop repeats a body. Solidity has three high-level loop forms: for, while and do-while. A for loop runs initialization once, then repeatedly checks its condition, executes the body and runs its update expression. It is convenient for array indexes. A while loop checks first and repeats while its condition is true. A do-while loop checks after the body and therefore executes at least once.

`break` exits the nearest enclosing loop. `continue` skips the remainder of that iteration; a for loop still runs its update expression. A while loop with continue can accidentally skip its manually written update and never make progress. `return` exits the entire function, including any surrounding loops. Nested loops multiply the amount of work; a pairwise comparison often has quadratic complexity.

Use i < array.length for zero-based traversal. A reverse loop can start at length, check i > 0 and use index i - 1. Checking i >= 0 for an unsigned integer never becomes false. Decrementing zero normally reverts in checked arithmetic.

A loop executes during a call, not in the background. An infinite loop consumes its gas and fails; it does not wait for another transaction to change its condition. Never rely on a growing storage array being small forever. Limit input length, use batches, or replace repeated searches with direct mapping lookups. Bounds must reflect real per-iteration costs.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

sum([10,20,30]) → 60; sum([]) → 0. halves(10) → 4 as 10→5→2→1→0. digits(0) → 1. positivesBeforeZero([4,-2,6,0,100]) → 10. Trace the condition, body and update separately on paper.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/control-structures.html)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/security-considerations.html#gas-limit-and-loops)

[Previous module](../04-arrays-strings-and-bytes/README.md) | [Course home](../../README.md) | [Next module](../06-mappings/README.md)
