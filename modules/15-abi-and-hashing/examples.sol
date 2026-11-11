// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract EncodingExamples {
    function roundTrip(uint256 id, address user) external pure returns (uint256, address) {
        bytes memory encoded = abi.encode(id, user);
        return abi.decode(encoded, (uint256, address));
    }
    function digest(string calldata text) external pure returns (bytes32) {
        return keccak256(bytes(text));
    }
    function selector() external pure returns (bytes4) {
        return bytes4(keccak256("transfer(address,uint256)"));
    }
}
