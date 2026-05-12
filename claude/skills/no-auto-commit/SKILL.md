---
name: no-auto-commit
description: Use before any git commit operation to verify the user has explicitly requested a commit in this conversation turn; prevents unsolicited commits after completing tasks or implementing features
---

# No Auto-Committing

## Overview

Committing without being asked overwrites the user's history without consent, mixes unrelated changes, and removes their control over what lands in git.

**Core principle:** A commit only happens when the user explicitly asks for one. Finishing a task is not a request to commit.

**Violating the letter of this rule is violating the spirit of this rule.**

## The Iron Law

```
NEVER RUN git commit UNLESS THE USER EXPLICITLY ASKED FOR IT IN THIS TURN
```

No exceptions. Task complete ≠ commit. Tests passing ≠ commit. Feature done ≠ commit.

## Required Check Before Every Commit

```
1. READ: Did the user's most recent message explicitly request a commit?
   - YES (e.g. "commit this", "make a commit", "commit and push") → Proceed.
   - NO  → STOP. Do not commit. Report what you did instead.
```

## What "Explicit Request" Means

**Counts as explicit:**
- "commit this"
- "make a commit"
- "commit and push"
- "save a commit"
- "create a git commit"

**Does NOT count as explicit:**
- "implement X" (implement only)
- "fix the bug" (fix only)
- "finish this feature" (finish only)
- "save my work" (ambiguous — clarify, don't assume commit)
- "done" / "looks good" (approval, not a commit request)
- "push it" without prior commit context (clarify first)

## Red Flags — STOP

- About to run `git commit` after finishing an implementation
- About to run `git commit` because "the task is done"
- Thinking "I'll commit so the user doesn't lose work"
- About to create a "checkpoint commit" mid-task
- Tests just passed and you're about to commit to celebrate
- About to commit as part of a multi-step plan the user didn't explicitly approve

## Rationalization Prevention

| Excuse | Reality |
|--------|---------|
| "The task is done, might as well commit" | Done ≠ committed. Report completion, wait for commit request. |
| "I'll save their work with a commit" | They didn't ask. Uncommitted changes are not lost. |
| "The plan said to commit at the end" | A plan is not an explicit request. Ask before committing. |
| "Tests pass, it's ready" | Ready ≠ committed. User decides when to commit. |
| "They said push it" | Clarify if they want a commit first, or if they mean something else. |
| "It's just a small commit" | Size is irrelevant. Was it requested? If no, don't do it. |
| "I'll commit so we can move to the next step" | Move to the next step without committing. |
| "They'll want it committed eventually" | Eventually is not now. Wait for the ask. |

## The Bottom Line

After completing any task, report what you did. Wait. If the user wants a commit, they will ask.

This is non-negotiable.
