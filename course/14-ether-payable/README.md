# Module 14 — Ether, wei and payable functions

**Prerequisites:** earlier modules in the [ordered index](../../TOPIC-INDEX.md). **Environment:** Remix VM; no real Ether.

## Detailed concept notes

### 1. Ether units

The native Ethereum currency is ether and its smallest denomination is wei. One ether equals 10 to the power 18 wei. A uint256 value does not tell you the unit unless the API specifies it.

### 2. Payable calls

A function must be payable to normally accept nonzero Ether attached to a call. msg.value is the wei amount sent with that call. Use Remix VM and its simulated balances for every exercise.

### 3. Balances and accounting

address(this).balance is the contract's current total Ether balance. An internal mapping of credits is a separate bookkeeping concept; the two may differ for several reasons.

### 4. Receive and fallback

A receive() external payable function handles plain Ether transfers with empty calldata. A fallback function can handle unmatched calls. These are different from explicitly calling a deposit() function.

### 5. Withdrawals

A deposit-only contract with no withdrawal mechanism can trap funds. Before paying out, validate the caller and available credit. Use checks-effects-interactions: update internal credit before initiating an external Ether transfer.

### 6. Failure handling and reentrancy

A low-level value transfer returns a success flag and may execute code in the recipient. Check the flag; if necessary revert to restore accounting. External callbacks can reenter a contract, making security review essential.

### 7. Safety limitation

The worked example is educational and unaudited. Never use it to store or accept real assets.

## Worked program and execution trace

Read the fully commented [Example.sol](Example.sol). Paste into [Remix](https://remix.ethereum.org/), compile with a compatible 0.8.x Solidity compiler, select the appropriate contract and deploy under **Remix VM**. If a file declares multiple contracts, deploy each required one separately.

**Predict → execute → observe:** Using only simulated Remix VM balances, deposit 10 wei, read credit(account)=10, withdraw 4, then read credit(account)=6. Try withdrawing 7 and observe revert.

## Knowledge check

1. How many wei are in one ether?
2. What does msg.value represent?
3. Why update credit before the payout?

## Study resources

[Hands-on exercises](EXERCISES.md) · [Independent quiz](QUIZ.md) · [Answers with explanations](ANSWERS.md) · [Reference implementation](Solutions.sol)

[Course index](../../TOPIC-INDEX.md) · [Previous](../13-interfaces-libraries/README.md) · [Next](../15-contract-calls/README.md)

> Educational examples are not audited.