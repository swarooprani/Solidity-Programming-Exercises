// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract ErrorSolutions {
    error OutOfRange(uint256 supplied);
    error DeliberateFailure();
    event Changed(address indexed caller, uint256 value);
    uint256 public value;
    function set(uint256 n) external {
        if (n > 10) revert OutOfRange(n);
        value = n; emit Changed(msg.sender, n);
    }
    function attemptThenFail(uint256 n) external {
        value = n; emit Changed(msg.sender, n);
        revert DeliberateFailure(); // Both effects above are rolled back.
    }
}
