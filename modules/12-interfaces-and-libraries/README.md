# 12. Interfaces, libraries and composition

Prerequisite: [Previous module](../11-inheritance/README.md)

## Learning outcomes

- Describe a contract API with an interface.
- Reuse internal library functions.
- Keep interface compatibility separate from trust.

## Explanation

An interface describes externally callable functions and their types. It lets a caller interact with an implementation without including that implementation's full source in the caller. An interface does not prove that the target address is trustworthy, honest, or even implements the expected behavior. Calls can still fail.

A library groups reusable logic. Internal library functions can be compiled into the using contract without a separately deployed library. Public/external library functions have a different deployment/linking model; this course starts with internal functions. `using LibraryName for Type` allows extension-like syntax, with the receiver passed as the first argument.

Composition connects separate instances. In the example, deploy the data source first and pass its address to the consumer constructor. The consumer stores a typed interface reference. read() performs an external view call to the source. That boundary matters: an actual deployment requires the target to exist on the same chain and supply a compatible API.

An interface defines shape, not policy. A price interface does not guarantee accurate prices; a token interface does not guarantee friendly transfer behavior. Validate trusted addresses and model failure handling according to your application. Keep pure library calculations separate from external calls so that each component's responsibilities remain easy to test.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Deploy ValueSource. Deploy ValueConsumer with that source address. doubled() → 42. Deploying with a wrong address is not prevented here; using it can fail. Explain which component owns each piece of data.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/contracts.html#interfaces)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/contracts.html#libraries)

[Previous module](../11-inheritance/README.md) | [Course home](../../README.md) | [Next module](../13-ether-and-payable/README.md)
