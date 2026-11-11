# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 14.1: Observe the immediate caller — Warm-up

Implement CallerTarget.who() returning msg.sender, plus CallSolutions constructed with a target and forwardedCaller() returning target.who(). Direct calls return the user; forwarded calls return the CallSolutions address.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 14.2: Catch a service failure — Application

In CallerTarget, add checked(n) accepting n<=10 and returning n*2. In CallSolutions, implement attempt(n) with try/catch returning (true,result) or (false,0). 4 → (true,8); 11 → (false,0).

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 14.3: Use a typed low-level payload — Challenge

Add rawWho() making target.call(abi.encodeCall(CallerTarget.who,())). Check success and decode the address. Mark the function non-view because it uses call. Reject zero or code-less target addresses in the constructor.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
