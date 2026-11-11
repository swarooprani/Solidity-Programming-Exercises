# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 09.1: Initialize an owner — Warm-up

Create owner and public value. The deployer becomes owner; owner-only setValue(n) changes value. Verify another account is rejected.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 09.2: Transfer ownership — Application

Add transferOwner(newOwner), restricted to the owner. Reject the zero address. After A transfers to B, B can setValue and A cannot. This is a single-step teaching example.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 09.3: Add an emergency pause — Challenge

Add public paused and owner-only setPaused(bool). setValue must reject calls while paused, including calls from the owner. Ownership transfer and unpausing must remain possible.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
