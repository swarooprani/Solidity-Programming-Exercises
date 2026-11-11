# 06. Mappings and explicit existence

Prerequisite: [Previous module](../05-loops/README.md)

## Learning outcomes

- Use key-to-value lookups.
- Distinguish an unset entry from a legitimate zero.
- Recognize when enumeration needs another structure.

## Explanation

A mapping associates a key with a value, for example student ID to score or address to enrollment status. `mapping(uint256 => uint256)` reads or writes a score at a particular ID. Every possible key reads as its type's default value until assigned. There is no undefined entry and no built-in contains operation.

This makes zero ambiguous. A score of zero might mean a real recorded zero or no recorded score. Store an additional bool such as `exists[id]`, or use a struct with an existence flag. `delete scores[id]` resets the value to zero. If existence is tracked separately, delete or update that flag too.

Mappings do not expose a length or an enumerable key list. To list records, maintain a separate array of keys and define how duplicate additions and deletions affect it. If only direct membership checks are needed, a mapping avoids scanning an array. Nested mappings model relationships such as user to course to enrollment status.

Mappings live in storage and cannot be returned as a whole ordinary ABI value. Public mapping getters retrieve values at specified keys. Public visibility does not authorize writes: define write functions and restrict callers when the business rules require it. The example lets each caller change only their own status by using msg.sender as the key.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Using account A, enrolled(A) starts false; enroll() makes it true. A second enroll reverts. Account B remains false. A calls leave() and returns to false.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/types.html#mapping-types)

[Previous module](../05-loops/README.md) | [Course home](../../README.md) | [Next module](../07-structs-and-enums/README.md)
