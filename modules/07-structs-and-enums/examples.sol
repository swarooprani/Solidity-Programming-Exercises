// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Read README.md for call sequences and expected results.
contract StructExamples {
    enum Status { Pending, Done }
    struct Task { string title; Status status; }
    Task[] private tasks;

    function add(string calldata title) external {
        require(bytes(title).length > 0, "Empty title");
        tasks.push(Task(title, Status.Pending));
    }
    function complete(uint256 id) external {
        Task storage task = tasks[id];
        require(task.status == Status.Pending, "Already done");
        task.status = Status.Done;
    }
    function get(uint256 id) external view returns (string memory, Status) {
        Task storage task = tasks[id]; return (task.title, task.status);
    }
}
