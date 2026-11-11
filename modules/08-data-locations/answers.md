# Quiz answers

**1. Which location persists across calls?**

Storage, for ordinary persistent state variables.

**2. Can you assign to an element of a calldata array?**

No. Calldata is read-only.

**3. Does storage-to-memory assignment create a copy?**

Yes. Editing the memory copy does not update storage.

**4. Does memory-to-memory assignment necessarily create an independent array?**

No. It normally aliases the same memory data.

[Back to lesson](README.md)
