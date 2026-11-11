# 03. Decisions and input validation

Prerequisite: [Previous module](../02-variables-and-functions/README.md)

## Learning outcomes

- Build exclusive if/else branches.
- Check boundaries and invalid inputs.
- Distinguish progressive rates from flat rates.

## Explanation

A conditional chooses a path according to a Boolean expression. `if` executes its body when true. `else if` checks another condition only if earlier conditions failed. `else` handles the remaining case. A chain chooses at most one branch; separate if statements can all execute.

Order matters. For grades, test the highest threshold first, or lower thresholds will capture higher scores. Before classifying an input, validate its domain. An unsigned score cannot be negative but it can still exceed a valid maximum such as 100. Use `require` for an invalid request, not an ordinary classification such as a failing grade.

The conditional operator `condition ? valueA : valueB` is useful for a short expression. Prefer if/else when several actions or explanations are needed. Parentheses around conditions are required. Braces make the intended scope clear, especially when nesting conditions.

Boundary testing is essential: for a threshold of 40, try 39, 40 and 41. For ranges, test both ends, a representative interior value, and a value outside the domain. In progressive billing, only units within each slab receive that slab's rate; applying the final rate to all units is a different business rule. Write the rule in words before coding it.

## Run and trace the example

Open [examples.sol](examples.sol) in Remix. Select the contract named in the trace. Use a compiler compatible with the pragma; automated checks use 0.8.30 and the Shanghai EVM target. See the [run guide](../../docs/GETTING-STARTED.md).

grade(39) → Fail; grade(40) → C; grade(60) → B; grade(80) → A; grade(100) → A. grade(101) reverts rather than returning a grade.

Before executing, predict the result. After executing, compare the output and stored state with your prediction. Try an empty/zero input, a normal input and an invalid or boundary input where applicable.

## Practice sequence

1. Complete the [three exercises](exercises.md) in a new file.
2. Attempt the [quiz](quiz.md) without opening the answers.
3. Compare with the [worked solutions](solutions.md) and [quiz answers](answers.md).
4. Explain one mistake you made and add a case that would catch it.

## References

- [Official reference 1](https://docs.soliditylang.org/en/v0.8.30/control-structures.html)

[Previous module](../02-variables-and-functions/README.md) | [Course home](../../README.md) | [Next module](../04-arrays-strings-and-bytes/README.md)
