# Quiz answers

**1. Can a view function assign to a state variable?**

No. That would modify state and violate view restrictions.

**2. Is a private variable secret?**

No. It limits Solidity access, not blockchain observability.

**3. Which visibility allows derived contracts to call a helper internally?**

internal; public also allows internal calls but additionally exposes an external interface.

**4. Can a local variable preserve a counter across transactions?**

No. Persistent counting requires state.

[Back to lesson](README.md)
