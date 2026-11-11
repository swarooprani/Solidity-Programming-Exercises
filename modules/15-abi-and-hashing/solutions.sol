// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract HashSolutions {
    mapping(address => bytes32) public commitments;
    mapping(address => bool) public hasCommit;
    function recordHash(uint256 id, string calldata title) external pure returns (bytes32) {
        return keccak256(abi.encode(id, title));
    }
    function commitment(address user, uint256 answer, bytes32 salt) public view returns (bytes32) {
        return keccak256(abi.encode(block.chainid, address(this), user, answer, salt));
    }
    function commit(bytes32 digest) external {
        commitments[msg.sender] = digest; hasCommit[msg.sender] = true;
    }
    function reveal(uint256 answer, bytes32 salt) external {
        require(hasCommit[msg.sender], "No commitment");
        require(commitments[msg.sender] == commitment(msg.sender, answer, salt), "Mismatch");
        delete commitments[msg.sender]; delete hasCommit[msg.sender];
    }
}
