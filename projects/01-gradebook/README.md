# Multi-student gradebook

Prerequisite: complete modules 00–17. Work from the specification before viewing [the reference implementation](solution.sol).

## Specification

Combine mappings, structs, validation, access control and events.

Build a gradebook where the deploying teacher records three subject marks for each student ID. Every mark is in 0..100. A zero score is valid, and an absent record must be distinguishable. Only the teacher can add/update a record. Anyone may read totals and integer averages. Updating must emit who/what changed.

Required API: owner(), setMarks(id,a,b,c), getMarks(id), total(id), average(id), and MarksSet(id,a,b,c). Test a fresh missing ID, all-zero marks, all-100 marks, unauthorized updates, a value 101 in each position, and replacement of an existing record. Failed updates must preserve the old record.

## Acceptance walkthrough

Deploy from A. A sets ID 1 to (85,90,75): total=250, average=83. B cannot overwrite it. A sets ID 2 to (0,0,0): its average is 0, while ID 3 is missing and reverts. A failed setMarks(1,101,0,0) leaves total(1)=250.

Compile solution.sol and select `Gradebook`. Use different Remix accounts for different actors. Run the normal path and every rejection specified above. The local test suite verifies these reference contracts as well.

## Submission

Provide your contract, a short README with setup/call instructions, a test matrix with expected outcomes, and a paragraph explaining the access model and limitations. Include evidence of failed calls preserving state.

## Rubric (100 points)

| Criterion | Points |
|---|---:|
| Required valid behavior | 30 |
| Input validation and rejection cases | 20 |
| Permissions and state transitions | 20 |
| Tests, including state preservation | 20 |
| Clear comments, units and run instructions | 10 |

## Optional extensions (not implemented in the reference)

- Add teacher transfer with acceptance by the new teacher.
- Add bounded batch entry and verify that one invalid record reverts the whole batch.
- Discuss why real student grades should not be stored publicly.

[All projects](../README.md) | [Course home](../../README.md)
