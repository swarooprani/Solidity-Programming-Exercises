# 02. Variables, functions and visibility

Prerequisite: [Previous module](../01-types-and-operators/README.md)

## Learning outcomes

- Separate persistent state from temporary local values.
- Use pure, view and state-changing functions.
- Choose visibility and return values.

## Explanation

State variables belong to a contract instance and normally persist in storage. Local variables exist during a function call. Parameters are inputs; return values are outputs. Variables have types and default values. A local calculation does not persist unless you assign its result to state.

`pure` functions neither read nor modify contract state. `view` functions may read state but cannot modify it. A function without either annotation may change state. These annotations describe permitted behavior, not a guarantee that every possible call costs no gas. Calls inside transactions consume gas even if the function is view or pure.

Visibility controls access paths. `external` functions are exposed to external callers; `public` functions can also be called internally by name. `internal` functions are available within the contract and derived contracts. `private` functions are available only within the declaring contract. Private storage is still observable on a public blockchain: visibility is not encryption.

`constant` values are fixed in source. `immutable` values are assigned during construction and cannot subsequently be changed. Named return values start at their type defaults and can be returned implicitly; explicit returns can be clearer for beginners. Use descriptive names and document units. Avoid changing state inside an expression whose main purpose appears to be a check.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Fresh `read()` → 0; call increment twice → read is 2. `double(6)` → 12 and leaves count unchanged. `_double` has no external call button because it is internal.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/contracts.html)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/structure-of-a-contract.html)

[Previous module](../01-types-and-operators/README.md) | [Course home](../../README.md) | [Next module](../03-conditionals/README.md)
