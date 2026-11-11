# Quiz answers

**1. Is compilation enough to prove a contract is correct?**

No. It checks language rules, not the complete intended behavior.

**2. What is an invariant for a point transfer?**

The total supply and the sum of participating balances remain unchanged by transfers.

**3. Why check state after a rejected transaction?**

To verify that failure did not leave partial changes or corrupt accounting.

**4. Do these passing tests make a contract production-ready?**

No. Test coverage and threat models are limited; production requires broader engineering and security work.

[Back to lesson](README.md)
