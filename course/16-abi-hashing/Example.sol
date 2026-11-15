// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract AbiHashDemo {
    function encoded(string calldata a, string calldata b)
        external pure returns (bytes32)
    {
        return keccak256(abi.encode(a, b));
    }
    function packed(string calldata a, string calldata b)
        external pure returns (bytes32)
    {
        return keccak256(abi.encodePacked(a, b));
    }
    function transferSelector() external pure returns (bytes4) {
        return bytes4(keccak256(bytes("transfer(address,uint256)")));
    }
}