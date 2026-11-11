# Quiz answers

**1. When A calls B and B calls C, who is msg.sender in C?**

B, the immediate caller.

**2. Does a message call create a separate transaction?**

No. It executes as part of the surrounding transaction.

**3. Does low-level call success prove a target implemented your intended operation?**

No. Even a code-less account can accept a call successfully.

**4. Can try/catch handle an ordinary failing internal helper call?**

No. Its supported boundary is an external call or contract creation, with additional limitations.

[Back to lesson](README.md)
