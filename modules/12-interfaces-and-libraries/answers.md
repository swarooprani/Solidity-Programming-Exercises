# Quiz answers

**1. Does an interface guarantee the target is honest?**

No. It describes expected calls and types, not trustworthy behavior.

**2. Must an internal-only library be deployed separately?**

No. Its used internal functions are compiled into the consumer.

**3. What does using L for uint256 enable?**

Library functions can be called on uint256 values with that value supplied as the first argument.

**4. Why deploy a source before its consumer?**

The consumer constructor needs the address of an existing source instance to call.

[Back to lesson](README.md)
