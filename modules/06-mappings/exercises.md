# Exercises

Implement these in a separate practice file. Work in order: warm-up, application, challenge. Use the exact behavior below; function names match the reference solutions.

## 06.1: Record a score including zero — Warm-up

Implement setScore(id,score), getScore(id), scores and exists mappings. Allow scores 0..100. getScore on an unset ID reverts; setScore(5,0) then getScore(5) returns 0.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 06.2: Delete consistently — Application

Add remove(id), clearing both score and existence. After removing ID 5, getScore(5) reverts. Removing an already absent ID may succeed without effect.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

## 06.3: Nested enrollment — Challenge

Add join(courseId) and joined(address,courseId). A caller may join each course once; duplicates revert. A and B enrolling in course 7 must have independent entries. No fees or identity verification.

Record your expected outputs before running. Check the normal result, a boundary case and the specified failure behavior.

[Back to lesson](README.md) | [Solutions](solutions.md)
