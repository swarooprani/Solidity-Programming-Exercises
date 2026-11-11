# 04. Arrays, strings and bytes

Prerequisite: [Previous module](../03-conditionals/README.md)

## Learning outcomes

- Use dynamic and fixed arrays with zero-based indexing.
- Explain push, pop and delete.
- Distinguish text from raw bytes.

## Explanation

An array stores ordered elements of one type. `uint256[3]` has fixed length three; `uint256[]` is dynamic. Indexes start at zero. An array of length n has valid indexes 0 through n - 1. Access outside that range reverts, including index zero on an empty array.

Dynamic storage arrays support `push` to append and `pop` to remove the last element. Popping an empty array reverts. `delete items[i]` resets an element to its default value; it does not shift elements or shorten the array. Memory arrays must be allocated with their length and cannot be resized with push/pop.

`string` represents text and `bytes` represents a variable-length byte sequence. `bytes32` is fixed length. Solidity does not provide general string indexing or a built-in text equality operator. Converting a string to bytes exposes its encoded bytes. UTF-8 characters can occupy multiple bytes, so bytes(text).length counts bytes, not necessarily user-visible characters.

Public array getters accept an index and return one element; they do not automatically return the entire array or expose its length. Provide a length getter if needed. Returning a huge array can be impractical: later we add pagination. For now, experiment with small inputs. Read-only array parameters use calldata; memory/storage behavior is explained in module 08.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Append 7 then 9. length() → 2; items(1) → 9. clearAt(0) leaves [0,9] and length 2. removeLast() leaves [0]. byteLength("cat") → 3.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/types.html#arrays)

[Previous module](../03-conditionals/README.md) | [Course home](../../README.md) | [Next module](../05-loops/README.md)
