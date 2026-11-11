// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract FirstStore {
    uint256 public number; // State starts at zero.

    function set(uint256 newNumber) external {
        number = newNumber; // Persists in this deployed instance.
    }
}
