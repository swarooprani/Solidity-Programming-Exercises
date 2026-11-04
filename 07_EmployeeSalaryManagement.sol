// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: EMPLOYEE SALARY MANAGEMENT
Save the deployer's address as owner. Store salaries in a mapping keyed
by employee ID. Only the owner may add/update salaries. Salary must not be zero.
Provide a function to retrieve an employee's salary.
*/
contract EmployeeSalaryManagement {
    address public owner; // Stores the owner's Ethereum address.
    mapping(uint256 => uint256) public employeeSalary; // Employee ID => salary.

    constructor() {
        // Constructor runs once during deployment.
        owner = msg.sender;
        // msg.sender is the address calling the current function.
        // During deployment, it is the deployer's address.
    }

    modifier onlyOwner() {
        // A modifier is a reusable check that can protect functions.
        require(msg.sender == owner, "Only the contract owner can do this");
        // Rejects the call if the caller is not the saved owner.
        _;
        // Underscore means: execute the protected function body here.
    }

    function setSalary(uint256 employeeId, uint256 salary) public onlyOwner {
        // onlyOwner runs before the body, so only the deployer can set salaries.
        require(salary > 0, "Salary must be greater than zero");
        // uint256 already prevents negative values; this rejects zero.
        employeeSalary[employeeId] = salary;
        // Stores salary under the employee ID; an existing value is updated.
    }

    function getSalary(uint256 employeeId) public view returns (uint256) {
        // Anyone can call this read-only function.
        return employeeSalary[employeeId]; // Returns zero if no salary was assigned.
    }
}
