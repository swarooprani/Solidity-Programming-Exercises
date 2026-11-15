// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract BoundedBatch {
    uint256 public totalProcessed;
    function process(uint256 count) external {
        require(count <= 25, "Batch too large");
        for (uint256 i = 0; i < count; i++) {
            totalProcessed++; // Pedagogical; direct addition is cheaper.
        }
    }
}