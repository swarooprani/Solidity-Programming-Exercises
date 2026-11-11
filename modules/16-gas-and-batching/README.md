# 16. Gas, pagination and bounded processing

Prerequisite: [Previous module](../15-abi-and-hashing/README.md)

## Learning outcomes

- Distinguish gas units from gas price.
- Paginate reads and persist batch progress.
- Avoid growing work in critical functions.

## Explanation

Gas measures execution work. A gas limit caps how much work a transaction or call may use; gas price influences the fee paid per unit. Neither is the same as an iteration count. One iteration that writes storage and calls another contract can cost far more than a local addition.

An ever-growing loop can become unusable even when every individual record is valid. Design critical operations with an explicit bound. Pagination returns a limited slice of data; batching performs a limited amount of work and stores progress. These are different uses of the same principle: avoid requiring all records to be handled in one call.

A cursor identifies the next item to process. Compute an exclusive end, process [start,end), then save the cursor. If the call reverts, its progress is not saved. Another transaction must explicitly continue. Define how appends, removals, concurrent callers and changes to the underlying data affect progress. This example uses a fixed dataset so a monotonically increasing cursor is sufficient.

Reading or writing storage, allocating memory and copying data all affect gas. Smaller integer types do not universally make programs cheaper. Avoid premature unchecked arithmetic: first prove the bounds and measure with the exact compiler and settings. There is no universal safe batch size for all operations or networks. The limits here are teaching choices, not deployment guarantees.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

process(10) → next 10,total 55. A second process(10) → next 20,total 210. A third → next 25,total 325. Further processing reverts. A fresh process(0) or process(11) also reverts.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/security-considerations.html#gas-limit-and-loops)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/internals/layout_in_storage.html)

[Previous module](../15-abi-and-hashing/README.md) | [Course home](../../README.md) | [Next module](../17-testing-and-security/README.md)
