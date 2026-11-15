// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract StructDemo {
    enum Status { Pending, Approved, Rejected }
    struct Record { uint256 score; bool exists; Status status; }
    mapping(uint256 => Record) private records;
    function create(uint256 id, uint256 score) external {
        require(!records[id].exists, "Already exists");
        require(score <= 100, "Score too high");
        records[id] = Record({score: score, exists: true, status: Status.Pending});
    }
    function decide(uint256 id, bool approve) external {
        require(records[id].exists, "Missing");
        require(records[id].status == Status.Pending, "Already decided");
        records[id].status = approve ? Status.Approved : Status.Rejected;
    }
    function get(uint256 id) external view returns (bool, uint256, Status) {
        Record storage record = records[id];
        return (record.exists, record.score, record.status);
    }
}