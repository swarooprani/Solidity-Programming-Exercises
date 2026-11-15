// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @notice First stateful contract: each deployment has its own counter.
contract IntroCounter {
    uint256 public count; // Public state variable gets a read-only getter.
    function set(uint256 next) external {
        count = next; // Writes persistent storage on a transaction.
    }
}