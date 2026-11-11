// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IVaultForTest {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
}

// Test-only receiver: rejects a withdrawal payment.
contract RejectingReceiver {
    IVaultForTest public vault;
    constructor(address target) { vault = IVaultForTest(target); }
    function fund() external payable { vault.deposit{value: msg.value}(); }
    function take(uint256 amount) external { vault.withdraw(amount); }
    receive() external payable { revert("Rejected"); }
}

// Test-only receiver: attempts a nested withdrawal and records the rejection.
contract ReentrantReceiver {
    IVaultForTest public vault;
    bool public attempted;
    bool public nestedSucceeded;
    constructor(address target) { vault = IVaultForTest(target); }
    function fund() external payable { vault.deposit{value: msg.value}(); }
    function take(uint256 amount) external { vault.withdraw(amount); }
    receive() external payable {
        if (!attempted) {
            attempted = true;
            (nestedSucceeded,) = address(vault).call(
                abi.encodeWithSelector(IVaultForTest.withdraw.selector, 1)
            );
        }
    }
}
