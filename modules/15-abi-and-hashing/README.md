# 15. ABI encoding, hashing and commitments

Prerequisite: [Previous module](../14-contract-calls/README.md)

## Learning outcomes

- Encode and decode typed values.
- Distinguish hashing from encryption and randomness.
- Bind a commitment to a caller and a domain.

## Explanation

The Application Binary Interface (ABI) defines how typed arguments, return values and events are represented. abi.encode produces a standard encoding from supplied types and values. abi.decode reads bytes according to a declared tuple of types. The bytes do not independently explain their intended schema: caller and receiver must agree.

keccak256 maps bytes to a bytes32 digest. It is deterministic: the same bytes give the same hash. It is not encryption, and a hash of a small predictable value can be guessed by trying possibilities. block.timestamp and public inputs do not become secure randomness just because they are hashed.

Use abi.encode for unambiguous tuple commitments. Packed encoding can collide for multiple dynamic arguments: ("ab","c") and ("a","bc") produce the same concatenation with abi.encodePacked. Prefer explicit schemas and domain separation, including the contract address, chain ID, account and operation where appropriate.

A commitment stores a hash first; a reveal supplies matching data later. An unpredictable salt helps prevent guessing before reveal. Once revealed on-chain, that salt and value are public. A real commit/reveal protocol also needs phase timing, non-reveal handling and economic rules. The exercise teaches digest binding and single-use reveal only; it is not a complete fair-game protocol.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

roundTrip(7,A) → (7,A). digest("hello") is repeatable; changing one byte changes the digest in ordinary examples. selector() → 0xa9059cbb, the first four bytes of the canonical signature hash.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/abi-spec.html)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/units-and-global-variables.html#abi-encoding-and-decoding-functions)

[Previous module](../14-contract-calls/README.md) | [Course home](../../README.md) | [Next module](../16-gas-and-batching/README.md)
