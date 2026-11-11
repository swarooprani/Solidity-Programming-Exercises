# Quiz answers

**1. Does a failed batch save its earlier loop iterations?**

No. Reverted state changes, including cursor changes, do not persist.

**2. Who starts the next batch?**

A user or external service must submit another call.

**3. Is a batch size of 100 always safe?**

No. Cost depends on the work per item, compiler settings and execution limits.

**4. What happens if records are removed before a cursor?**

Indexes may shift and cause skipped or repeated processing. Define a strategy before allowing mutation.

[Back to lesson](README.md)
