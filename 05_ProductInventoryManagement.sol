// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: PRODUCT INVENTORY MANAGEMENT
Store one product's name and quantity. Allow stock to be added and a
specified quantity to be sold. A sale must not exceed available stock.
Enter product name and starting quantity when deploying.
*/
contract ProductInventoryManagement {
    string public productName; // Stores product text; public creates a getter.
    uint256 public availableQuantity; // Stores current stock quantity.

    constructor(string memory _productName, uint256 _initialQuantity) {
        // string is a reference type, so the parameter specifies memory.
        // memory is temporary input data during this call.
        productName = _productName; // Saves the name persistently in contract storage.
        availableQuantity = _initialQuantity; // Sets the starting stock.
    }

    function addStock(uint256 quantity) public {
        // quantity is the number of units to add.
        require(quantity > 0, "Quantity to add must be greater than zero");
        availableQuantity = availableQuantity + quantity; // Increases stored stock.
    }

    function sellProduct(uint256 quantity) public {
        // quantity is the number of units requested by the customer.
        require(quantity > 0, "Sale quantity must be greater than zero");
        require(quantity <= availableQuantity, "Not enough stock available");
        // Rejects a sale larger than the stock currently available.
        availableQuantity = availableQuantity - quantity; // Reduces stock by the sold quantity.
    }

    function getCurrentStock() public view returns (uint256) {
        // view: reads the current quantity without changing it.
        return availableQuantity; // Returns current stock.
    }
}
