// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract LocationExamples {
    uint256[] public values;
    constructor() { values.push(10); values.push(20); }
    function copiedChange() external view returns (uint256[] memory result) {
        result = values; // Independent storage-to-memory copy.
        result[0] = 99; // Does not change values[0].
    }
    function aliasedChange() external {
        uint256[] storage aliasValues = values;
        aliasValues[0] = 99; // Changes persistent state.
    }
}
