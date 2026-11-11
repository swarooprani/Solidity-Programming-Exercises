# Quiz answers

**1. What is 9 / 4 using uint256 values?**

2. Integer division discards the remainder.

**2. Is uint8 always cheaper than uint256?**

No. Storage packing can help, but other contexts and conversions can cost more. Measure.

**3. Does 1 ether send money?**

No. It is a numeric literal equal to 10**18 wei.

**4. What normally happens when uint8 addition exceeds 255?**

It reverts in checked Solidity 0.8.x arithmetic; unchecked arithmetic wraps.

[Back to lesson](README.md)
