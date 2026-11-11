// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Educational reference implementation; see README.md for the specification.
contract Gradebook {
    struct Marks { uint256 a; uint256 b; uint256 c; bool exists; }
    address public immutable owner;
    mapping(uint256 => Marks) private records;
    event MarksSet(uint256 indexed id, uint256 a, uint256 b, uint256 c);
    constructor() { owner = msg.sender; }
    function setMarks(uint256 id, uint256 a, uint256 b, uint256 c) external {
        require(msg.sender == owner, "Not teacher");
        require(a <= 100 && b <= 100 && c <= 100, "Mark above 100");
        records[id] = Marks(a, b, c, true);
        emit MarksSet(id, a, b, c);
    }
    function getMarks(uint256 id) public view returns (uint256, uint256, uint256) {
        Marks storage m = records[id];
        require(m.exists, "Missing record"); return (m.a, m.b, m.c);
    }
    function total(uint256 id) public view returns (uint256) {
        (uint256 a, uint256 b, uint256 c) = getMarks(id); return a + b + c;
    }
    function average(uint256 id) external view returns (uint256) {
        return total(id) / 3; // Rounded down; marks use whole-number units.
    }
}
