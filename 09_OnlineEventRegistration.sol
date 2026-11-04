// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: ONLINE EVENT REGISTRATION
Set event capacity to 50. Use a mapping to track each participant.
Each participant may register once only. Reject registrations after capacity.
Maintain and display the total number registered.
This solution identifies a participant by their Ethereum address (msg.sender).
*/
contract OnlineEventRegistration {
    uint256 public constant MAX_CAPACITY = 50;
    // constant means this value is fixed and cannot be changed after compilation.

    mapping(address => bool) public isRegistered;
    // Participant address => true if registered, false otherwise.

    uint256 public totalRegistrations;
    // Counter for successful registrations; starts at zero.

    function register() public {
        // The caller registers; msg.sender identifies the caller's address.
        require(!isRegistered[msg.sender], "This address is already registered");
        // ! means logical NOT. This condition is true only if the caller is not registered.
        require(totalRegistrations < MAX_CAPACITY, "Event registration capacity is full");
        // A new registration is allowed only while the count is below 50.
        isRegistered[msg.sender] = true; // Marks this caller's address as registered.
        totalRegistrations = totalRegistrations + 1; // Increments the count after registration.
    }

    function getTotalRegistrations() public view returns (uint256) {
        // view reads the counter without changing it.
        return totalRegistrations; // Returns the number of successful registrations.
    }

    function remainingSeats() public view returns (uint256) {
        // Helper function to show the number of places still available.
        return MAX_CAPACITY - totalRegistrations; // Capacity minus registrations so far.
    }
}
