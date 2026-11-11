# 13. Ether, payable functions and withdrawals

Prerequisite: [Previous module](../12-interfaces-and-libraries/README.md)

## Learning outcomes

- Keep monetary values in wei.
- Receive explicit deposits and track individual balances.
- Apply checks-effects-interactions and check transfer results.

## Explanation

Ether is the native asset; wei is its smallest unit. msg.value is the number of wei attached to the current call. A payable function can accept that value. Merely declaring payable does not record which user should own a deposit: your accounting must do that explicitly.

A receive() external payable function handles empty calldata when present. A payable fallback handles unmatched calls, including empty calldata if there is no receive. These special entry points are different from an explicit deposit function. This example deliberately credits deposits only through deposit(). Unexpected Ether can still arrive by mechanisms outside that function, so the contract's actual balance and its recorded liabilities are distinct concepts.

A withdrawal involves an external interaction. First check the request, then reduce the user's recorded balance, then transfer value. Check the low-level call's success result; if it fails and you revert, the accounting change is rolled back. A reentrancy guard adds protection against nested entry during the transfer.

Never let a caller choose another user's balance to withdraw without authorization. Prefer each recipient claiming their own funds over looping through all recipients. Use only simulated money for these teaching contracts. Their purpose is to demonstrate accounting and failure handling; a production vault needs a broader design and security review.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

In Remix, select Value = 100 and unit wei, then call deposit(). credit(caller) and contractBalance() are 100. Set Value back to 0 before calling nonpayable functions. A zero-value deposit reverts. This example intentionally has no withdrawal function; use only Remix VM.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/contracts.html#receive-ether-function)
- [Official reference 2](https://docs.soliditylang.org/en/v0.8.30/security-considerations.html#reentrancy)

[Previous module](../12-interfaces-and-libraries/README.md) | [Course home](../../README.md) | [Next module](../14-contract-calls/README.md)
