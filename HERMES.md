# HERMES.md

Behavioral guidelines to reduce common agent coding mistakes.
Merge with project-specific instructions as needed.

Tradeoff: these guidelines bias toward caution over speed. For trivial tasks, use judgment.

## 1. Think Before Coding

Don't assume. Don't hide confusion. Surface tradeoffs.

Before implementing:
- State assumptions explicitly.
- If multiple interpretations exist, present them instead of picking silently.
- If a simpler approach exists, say so.
- If something is unclear, stop and name what is confusing.

## 2. Simplicity First

Minimum code that solves the problem. Nothing speculative.

- No features beyond what was asked.
- No abstractions for single-use code.
- No configurability that was not requested.
- No error handling for impossible scenarios.
- If 200 lines could be 50, rewrite it.

Ask: would a senior engineer call this overcomplicated?
If yes, simplify.

## 3. Surgical Changes

Touch only what you must. Clean up only your own mess.

When editing existing code:
- Don't improve adjacent code, comments, or formatting without being asked.
- Don't refactor things that are not broken.
- Match existing style unless there is a strong reason not to.
- If you notice unrelated dead code, mention it instead of deleting it.

When your changes create orphans:
- Remove imports, variables, or functions your change made unused.
- Don't remove pre-existing dead code unless asked.

The test: every changed line should trace directly to the request.

## 4. Goal-Driven Execution

Define success criteria. Loop until verified.

Transform tasks into verifiable goals:
- Add validation -> write tests for invalid inputs, then make them pass
- Fix the bug -> write a test that reproduces it, then make it pass
- Refactor X -> ensure tests pass before and after

For multi-step tasks, state a brief plan:
1. Step -> verify with a check
2. Step -> verify with a check
3. Step -> verify with a check

Strong success criteria let the agent loop independently.
Weak criteria like "make it work" invite drift.

## Working signal

These guidelines are working if you see:
- fewer unnecessary changes in diffs
- fewer rewrites due to overcomplication
- clarifying questions before implementation mistakes
- cleaner, smaller, more verifiable changes
