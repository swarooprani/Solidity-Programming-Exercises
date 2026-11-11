# 14. External calls, low-level calls and try/catch

Prerequisite: [Previous module](../13-ether-and-payable/README.md)

## Learning outcomes

- Distinguish internal calls from external calls.
- Handle an expected external failure.
- Understand why call boundaries require care.

## Explanation

Calling a function internally by name stays within the current contract execution context. Calling another contract performs an external message call; inside that callee, msg.sender is the calling contract. One transaction may contain many message calls. An external call is not a new independent transaction.

Typed calls use a known ABI and normally propagate a revert if failure is not caught. try/catch can handle failure from an external function call or contract creation. It does not catch arbitrary internal failures in the caller or every error while preparing arguments. In particular, do not assume a try block catches every ABI decoding failure in the calling contract.

Low-level call returns a success bool and raw bytes. Success alone does not prove that the intended business operation happened: a call to an account without code can succeed. Prefer typed interfaces when the API is known, validate addresses according to the design, and decode only according to an expected schema.

Any external call can transfer control to untrusted code, even without an Ether transfer. Model reentrancy and failure before writing the caller's state transitions. delegatecall is an advanced mechanism that executes another address's code in the caller's storage context; arbitrary user-controlled delegatecall targets are dangerous and are not part of this beginner implementation track.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

Deploy DivisionService, then CallExamples with its address. safeDivide(9,2) → (true,4). safeDivide(9,0) → (false,0), because this caller catches the service's require failure.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/control-structures.html#external-function-calls)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/control-structures.html#try-catch)

[Previous module](../13-ether-and-payable/README.md) | [Course home](../../README.md) | [Next module](../15-abi-and-hashing/README.md)
