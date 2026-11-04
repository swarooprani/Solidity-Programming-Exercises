// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
PROBLEM: ELECTRICITY BILL CALCULATOR
Calculate a bill using progressive slabs:
- First 100 units: Rs. 2 per unit
- Next 100 units: Rs. 3 per unit
- Units above 200: Rs. 5 per unit
Example for 250 units: (100*2) + (100*3) + (50*5) = Rs. 750.
Zero units are valid. The problem gives no maximum consumption limit.
Progressive slabs mean only the units in each slab use that slab's rate.
*/
contract ElectricityBillCalculator {
    function calculateBill(uint256 units) public pure returns (uint256) {
        // units is the input parameter. uint256 cannot represent negative numbers.
        // pure means the function neither reads nor changes stored contract data.
        // It calculates the result using only its input. returns declares the result type.
        uint256 bill; // Local variable: temporary calculation result; initially zero.

        if (units <= 100) {
            // First slab: 0 to 100 units.
            bill = units * 2; // All units cost Rs. 2 each.
        } else if (units <= 200) {
            // Second slab: more than 100 and up to 200 units.
            bill = (100 * 2) + ((units - 100) * 3);
            // First 100 at Rs. 2; only the extra units at Rs. 3.
        } else {
            // Third slab: consumption is greater than 200 units.
            bill = (100 * 2) + (100 * 3) + ((units - 200) * 5);
            // First 100 at Rs. 2, next 100 at Rs. 3, remainder at Rs. 5.
        }
        return bill; // Sends the calculated bill back to the caller.
    }
}
