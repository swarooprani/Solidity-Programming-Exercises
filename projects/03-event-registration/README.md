# Capacity-limited event registration

Prerequisite: complete modules 00–17. Work from the specification before viewing [the reference implementation](solution.sol).

## Specification

Combine membership, capacity invariants, cancellation and administration.

The deployer is organizer and chooses capacity 1..100. While registration is open, each address may register once if a seat is available. Registered addresses may cancel even when registration is closed. Only the organizer may open/close registration. A cancellation frees one seat. Count must never exceed capacity and must match active registrations in the tested participant set.

Required API: organizer(), capacity(), count(), open(), registered(address), register(), cancel(), setOpen(bool), remaining(), plus Registered/Cancelled/OpenChanged events. Test capacity 0/101 at construction, duplicates, full capacity, cancellation and re-registration, nonmember cancellation, unauthorized setOpen, closure and reopening. Address uniqueness is not person uniqueness.

## Acceptance walkthrough

Deploy capacity 2. A and B register; remaining=0 and C is rejected. Organizer closes registration. B cancels successfully; remaining=1, but C is still rejected while closed. Organizer reopens; C registers and remaining=0.

Compile solution.sol and select `EventRegistration`. Use different Remix accounts for different actors. Run the normal path and every rejection specified above. The local test suite verifies these reference contracts as well.

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

- Add an organizer-maintained allowlist and discuss its trust assumptions.
- Add start/end times and test exact boundary behavior.
- Design a paid version with refunds using pull withdrawals; write a threat model before coding.

[All projects](../README.md) | [Course home](../../README.md)
