# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 16.1: Paginate a fixed list — Warm-up

Initialize private data to [10,20,30,40,50]. Implement page(offset,limit) view, allowing limit 1..3 and offset <= length. page(1,3) → [20,30,40]; page(5,2) → []; offset 6 or limit 0/4 reverts.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 16.2: Process limited batches — Application

On the same list, implement process(count), allowing 1..2 per call, plus public next and total. Three process(2) calls produce totals 30,100,150 and cursors 2,4,5. Reject processing after completion.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 16.3: Report remaining work — Challenge

Implement remaining() view returning data.length-next. It starts at 5 and reaches 0. Verify invalid calls preserve total and next. Explain why a growing/deletable list requires additional design.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
