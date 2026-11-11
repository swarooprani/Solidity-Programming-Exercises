// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract BatchExamples {
    uint256[] private data;
    uint256 public next;
    uint256 public total;
    constructor() {
        for (uint256 i = 1; i <= 25; i++) data.push(i);
    }
    function process(uint256 count) external {
        require(count > 0 && count <= 10, "Count 1 to 10");
        require(next < data.length, "Finished");
        uint256 end = next + count;
        if (end > data.length) end = data.length;
        uint256 subtotal;
        for (uint256 i = next; i < end; i++) subtotal += data[i];
        total += subtotal; next = end; // Save successful progress.
    }
}
