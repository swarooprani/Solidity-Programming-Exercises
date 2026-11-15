// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AbiPractice {
    function recordHash(uint256 id, string calldata label) external pure returns (bytes32) {
        return keccak256(abi.encode(id, label));
    }
    function dangerousHash(string calldata a, string calldata b) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(a,b));
    }
    function safeHash(string calldata a, string calldata b) external pure returns (bytes32) {
        return keccak256(abi.encode(a,b));
    }
}