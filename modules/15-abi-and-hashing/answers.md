# Quiz answers

**1. Is hashing encryption?**

No. Hashes are not decrypted, and predictable inputs can be guessed and checked.

**2. Why avoid packed encoding for two dynamic strings?**

Different splits such as ab+c and a+bc can produce identical packed bytes.

**3. What is a function selector?**

The first four bytes of the Keccak-256 hash of the canonical function signature.

**4. Does this single-use commitment solve all fair-game problems?**

No. It lacks phases, deadlines, non-reveal handling and economic rules.

[Back to lesson](README.md)
