# Quiz answers

**1. What does an unset uint256 mapping key return?**

Zero, which is also a valid explicitly stored value.

**2. Can a mapping list all its keys by itself?**

No. Track keys separately if enumeration is needed.

**3. Does delete remove a key from a maintained key array?**

No. You must update that separate structure yourself.

**4. Why use msg.sender as the enrollment key?**

It ties the entry to the immediate caller, preventing this function from selecting another address to modify.

[Back to lesson](README.md)
