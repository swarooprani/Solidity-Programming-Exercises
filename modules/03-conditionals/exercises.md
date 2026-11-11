# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 03.1: Find the larger value — Warm-up

Implement larger(a,b) returning the larger uint256; equal inputs return that value. Check (3,8) → 8 and (4,4) → 4.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 03.2: Progressive bill — Application

Implement bill(units): first 100 cost 2 each, next 100 cost 3 each, remainder cost 5 each. Check 0 → 0, 100 → 200, 200 → 500, 250 → 750.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 03.3: Validate and classify age — Challenge

Implement category(age), accepting 0..150. Return Child for <13, Teen for 13..19, Adult for 20..59, Senior for 60..150. Check every transition and reject 151.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
