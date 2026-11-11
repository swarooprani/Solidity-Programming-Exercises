# 01. Value types, units and operators

Prerequisite: [Previous module](../00-start-here/README.md)

## Learning outcomes

- Choose bool, integers, address and fixed bytes appropriately.
- Use arithmetic and comparison operators.
- Explain integer rounding and checked arithmetic.

## Explanation

A type describes which values a variable can represent and which operations are valid. `uint256` represents integers from 0 to 2**256 - 1; `int256` also supports negative numbers. `uint8` has range 0 through 255. `uint` is an alias for `uint256`. Default values include 0 for integers, false for bool, and the zero address for address.

Arithmetic operators include `+`, `-`, `*`, `/`, `%` and `**`. Comparisons such as `>=` produce bool values. `&&`, `||` and `!` combine or negate conditions. `&&` and `||` short-circuit, so later expressions may not execute. Bitwise operations (`&`, `|`, `^`, `~`, `<<`, `>>`) operate on bits; learn them after ordinary arithmetic.

Integer division discards the fractional portion: 7 / 2 is 3. Model decimal quantities with a documented scale, such as cents or basis points. Multiplying before dividing can preserve precision but can also overflow. Solidity 0.8.x normally reverts on arithmetic overflow or underflow. `unchecked` disables those checks inside its block and needs a separate correctness argument.

`address` identifies an account; it is not proof of who controls it. `bytes32` holds exactly 32 bytes. `string` and dynamic `bytes` are covered later. `1 ether` is a numeric denomination equal to 10**18 wei; it does not initiate a payment. Narrowing conversions can truncate, so validate before converting.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

`quotientAndRemainder(7, 2)` → `(3, 1)`; `(7, 0)` reverts. `isEven(0)` → true. `oneEtherInWei()` → 1000000000000000000. Record units next to every monetary input.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/types.html)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/units-and-global-variables.html)

[Previous module](../00-start-here/README.md) | [Course home](../../README.md) | [Next module](../02-variables-and-functions/README.md)
