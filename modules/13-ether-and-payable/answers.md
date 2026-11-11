# Quiz answers

**1. What unit does msg.value use?**

Wei, regardless of the unit selected in the Remix input UI.

**2. Does payable automatically credit a user balance?**

No. The contract must implement its own accounting.

**3. Why reduce credit before transferring Ether?**

It prevents a callback from observing the old spendable credit; a guard provides additional protection.

**4. Must actual contract balance equal recorded liabilities?**

No. Unsolicited Ether can make actual balance larger. Track liabilities explicitly.

[Back to lesson](README.md)
