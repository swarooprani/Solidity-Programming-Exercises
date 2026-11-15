# Module 15 — Practice

**Directions:** implement your own file in Remix. Predict three normal or boundary outputs and test an invalid input when applicable. Avoid looking at the reference until finished.

### Exercise A — Warm-up
Write an interface for a deployed contract's public getter and read it from a second contract.

### Exercise B — Application
Create a typed external call wrapped in try/catch that returns a success flag and a safe fallback.

### Exercise C — Challenge
Explain why a low-level call's success bool does not prove a business operation succeeded; describe a possible reentrancy path.

## Self-evaluation
Check the type of each input, who may call the function, and how storage changes. A reverted transaction must not leave partial changes. Write one paragraph about a mistake you corrected.

[Lesson](README.md) · [Quiz](QUIZ.md) · [Reference solution](Solutions.sol)