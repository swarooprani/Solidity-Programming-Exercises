// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface ICounterView { function count() external view returns (uint256); }
contract CounterSource {
    uint256 public count;
    function increment() external { count++; }
}
contract CallerPractice {
    function read(address target) external view returns (bool, uint256) {
        require(target != address(0), "Bad target");
        try ICounterView(target).count() returns (uint256 n) {
            return (true,n);
        } catch {
            return (false,0);
        }
    }
}