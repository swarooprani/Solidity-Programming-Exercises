// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract BaseGreeting {
    function greeting() public pure virtual returns (string memory) { return "Hello"; }
    function number() public pure virtual returns (uint256) { return 10; }
}
contract FriendlyGreeting is BaseGreeting {
    function greeting() public pure override returns (string memory) { return "Welcome"; }
    function number() public pure override returns (uint256) {
        return super.number() + 5; // Reuse base behavior, then extend it.
    }
}
