# 11. Inheritance and overriding

Prerequisite: [Previous module](../10-errors-and-events/README.md)

## Learning outcomes

- Reuse behavior through a base contract.
- Use virtual, override and super.
- Recognize composition as another design option.

## Explanation

Inheritance lets a derived contract reuse state and functions from a base contract. Write `contract Child is Parent`. A derived deployment includes its inherited behavior; inheritance does not create a separate parent instance that receives calls. Private base members are not directly accessible by name in the child, while internal members are.

A function intended for overriding is marked virtual. The derived implementation uses override. `super.functionName()` calls the next implementation in the inheritance linearization; it does not always mean a single textually named parent in multiple inheritance. Begin with one base before studying multiple-base resolution.

Constructor arguments required by a base must be supplied. An abstract contract can contain unimplemented functions and cannot itself be deployed; a concrete derived contract must implement them. Interfaces, introduced next, describe an external API without supplying ordinary implementation state.

Inheritance is useful for shared authorization or a common behavior family. It can also make control flow harder to follow when many parents override the same hooks. Prefer a small, understandable hierarchy. Composition means holding a reference to another contract or using a helper instead of inheriting. Choose based on the relationship you need, and test the final derived contract because its override determines behavior.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Deploy BaseGreeting: greeting() → Hello, number() → 10. Deploy FriendlyGreeting: greeting() → Welcome, number() → 15. These are separate deployments; the child does not alter the base instance.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/contracts.html#inheritance)

[Previous module](../10-errors-and-events/README.md) | [Course home](../../README.md) | [Next module](../12-interfaces-and-libraries/README.md)
