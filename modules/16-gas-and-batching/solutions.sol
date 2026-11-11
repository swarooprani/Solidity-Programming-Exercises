// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract GasSolutions {
    uint256[] private data;
    uint256 public next;
    uint256 public total;
    constructor() {
        for (uint256 i = 1; i <= 5; i++) data.push(i * 10);
    }
    function page(uint256 offset, uint256 limit) external view returns (uint256[] memory out) {
        require(limit > 0 && limit <= 3 && offset <= data.length, "Bad page");
        uint256 end = offset + limit;
        if (end > data.length) end = data.length;
        out = new uint256[](end - offset);
        for (uint256 i = offset; i < end; i++) out[i - offset] = data[i];
    }
    function process(uint256 count) external {
        require(count > 0 && count <= 2 && next < data.length, "Bad batch");
        uint256 end = next + count;
        if (end > data.length) end = data.length;
        uint256 subtotal;
        for (uint256 i = next; i < end; i++) subtotal += data[i];
        total += subtotal; next = end;
    }
    function remaining() external view returns (uint256) { return data.length - next; }
}
