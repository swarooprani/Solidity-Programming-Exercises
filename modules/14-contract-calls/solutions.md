# Worked solutions

Attempt the [exercises](exercises.md) first. The complete commented implementation is in [solutions.sol](solutions.sol). Each exercise is one step of the same topic; deploy the named solution contract(s) and run the stated cases.

## 14.1: Observe the immediate caller

Implement CallerTarget.who() returning msg.sender, plus CallSolutions constructed with a target and forwardedCaller() returning target.who(). Direct calls return the user; forwarded calls return the CallSolutions address.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 14.2: Catch a service failure

In CallerTarget, add checked(n) accepting n<=10 and returning n*2. In CallSolutions, implement attempt(n) with try/catch returning (true,result) or (false,0). 4 → (true,8); 11 → (false,0).

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

## 14.3: Use a typed low-level payload

Add rawWho() making target.call(abi.encodeCall(CallerTarget.who,())). Check success and decode the address. Mark the function non-view because it uses call. Reject zero or code-less target addresses in the constructor.

Compare your code with the corresponding functions in solutions.sol. Explain the validation, the state written (if any), and why the expected result follows.

[Back to lesson](README.md)

## Why the implementations work

**Exercise 1.** The forwarded call has the forwarding contract as immediate sender. It does not preserve the original user as msg.sender.

**Exercise 2.** try/catch converts the service’s revert into an explicit false result. Callers must inspect that bool instead of accepting zero as a successful value.

**Exercise 3.** abi.encodeCall provides a typed payload. The low-level result must still be checked and decoded; code existence is not a universal trust guarantee.
