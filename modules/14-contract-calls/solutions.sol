// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Reference solutions: attempt exercises.md before opening this file.
contract CallerTarget {
    function who() external view returns (address) { return msg.sender; }
    function checked(uint256 n) external pure returns (uint256) {
        require(n <= 10, "Too large"); return n * 2;
    }
}
contract CallSolutions {
    CallerTarget public target;
    constructor(address addr) {
        require(addr.code.length > 0, "Target has no code"); target = CallerTarget(addr);
    }
    function forwardedCaller() external view returns (address) { return target.who(); }
    function attempt(uint256 n) external view returns (bool, uint256) {
        try target.checked(n) returns (uint256 v) { return (true, v); }
        catch { return (false, 0); }
    }
    function rawWho() external returns (address) {
        (bool ok, bytes memory result) = address(target).call(abi.encodeCall(CallerTarget.who, ()));
        require(ok, "Call failed"); return abi.decode(result, (address));
    }
}
