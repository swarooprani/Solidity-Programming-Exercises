# Quiz answers

**1. How many branches execute in one if/else-if/else chain?**

At most one. A final else ensures one branch is selected.

**2. Why check 39, 40 and 41 for a pass mark of 40?**

They expose off-by-one mistakes around the threshold.

**3. Is uint256 enough to validate a score out of 100?**

No. It excludes negatives but still permits values above 100.

**4. Why is a progressive bill for 250 units not 250 * 5?**

Earlier units retain their lower slab rates. Only the last 50 units use rate 5.

[Back to lesson](README.md)
