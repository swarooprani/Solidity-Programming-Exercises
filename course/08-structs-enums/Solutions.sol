// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract StructPractice {
    enum OrderStatus { Pending, Delivered, Cancelled }
    struct Item { string name; uint256 quantity; bool exists; }
    mapping(uint256 => Item) public items;
    mapping(uint256 => OrderStatus) public orderStatus;
    function create(uint256 id, string calldata name, uint256 qty) external {
        require(!items[id].exists, "Exists");
        items[id] = Item(name, qty, true);
    }
    function addStock(uint256 id, uint256 qty) external {
        require(items[id].exists && qty > 0, "Invalid");
        items[id].quantity += qty;
    }
    function finish(uint256 id, bool deliver) external {
        require(orderStatus[id] == OrderStatus.Pending, "Finalized");
        orderStatus[id] = deliver ? OrderStatus.Delivered : OrderStatus.Cancelled;
    }
}