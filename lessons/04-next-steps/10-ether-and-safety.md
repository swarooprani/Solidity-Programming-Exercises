# 10. Ether, payable functions, and safe boundaries

**Level:** Next steps · **Time:** about 20–40 minutes

## What you'll learn
A contract can accept native Ether through a `payable` function. `msg.value` reports wei sent with a call; 1 ether equals 10^18 wei. Unlike simple integer exercises, money-handling code introduces security obligations.

## Understand it
Never put real assets into tutorial contracts. Sending Ether into a contract does not imply you can withdraw it later. External calls, reentrancy, authorization, and withdrawal patterns need careful testing and established libraries before production use.

## Try this in Remix
1. Create `10-ether-and-safety.sol` in [Remix](https://remix.ethereum.org/).
2. Paste the code below, compile with a compatible Solidity 0.8.x version, select **Remix VM**, and deploy.
3. Predict the result, run the call, then compare what happened.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract DepositDemo {
    event Deposited(address indexed from, uint256 amount);
    function deposit() external payable {
        require(msg.value > 0, "Send some wei");
        emit Deposited(msg.sender, msg.value);
    }
    function balance() external view returns (uint256) {
        return address(this).balance;
    }
}
```

**Check:** In Remix VM, send a small simulated value to deposit(), inspect the event, and read balance(). Do not use real ETH: this demonstration deliberately has no withdrawal function.

## Your turn
Explain why accepting a deposit without a withdrawal design is unsuitable for a production application. List two risks of calling an untrusted contract.

## Self-check
- Can you explain what each state-changing function does?
- Did you try a normal case, a boundary case, and a failure case where applicable?
- Could you explain the result without looking at this page?

[← Previous](../03-contract-behavior/09-registration-project.md) · [All lessons](../../README.md) · [Next →](../04-next-steps/11-testing-and-review.md)

> Educational examples only. Use Remix VM and simulated assets, not production funds.
