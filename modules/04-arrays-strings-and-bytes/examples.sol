// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract ArrayExamples {
    uint256[] public items;
    function append(uint256 n) external { items.push(n); }
    function removeLast() external {
        require(items.length > 0, "Empty array");
        items.pop();
    }
    function clearAt(uint256 i) external { delete items[i]; }
    function length() external view returns (uint256) { return items.length; }
    function byteLength(string calldata text) external pure returns (uint256) {
        return bytes(text).length; // UTF-8 byte count, not character count.
    }
}
