// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
interface IDoubler {
    function twice(uint256 n) external pure returns (uint256);
}
contract BoundedDoubler {
    function twice(uint256 n) external pure returns (uint256) {
        require(n <= 100, "Too large");
        return 2 * n;
    }
}
contract SafeCaller {
    function attempt(address target, uint256 n)
        external view returns (bool succeeded, uint256 value)
    {
        require(target != address(0), "Zero address");
        try IDoubler(target).twice(n) returns (uint256 result) {
            return (true, result);
        } catch {
            return (false, 0); // External call reverted.
        }
    }
}