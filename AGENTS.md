# AGENTS.md

# (Lightweight rules for Codex)

## 1. Branch Types & Bases

* **main**: production only
* **develop**: integration branch
* **feature/<slug>** → base: `develop`
* **bugfix/<slug>** → base: `develop`
* **release/<version>** → base: `develop`, merge → `main` + `develop`
* **hotfix/<slug>** → base: `main`, merge → `main` + `develop`

Agents NEVER commit directly to `main`. The `develop` branch only receives merges from feature/bugfix work that has passed validation.

---

## 2. How Agents Start Work

Agents scan TODO.md and for the first unchecked block:

1. Identify branch type + slug.
2. Create branch from the correct base.
3. Make required changes.
4. Run lint/tests (use scripts in `scripts/`).
5. Commit once with a clear message.
6. When tasks + scripts are green, merge the feature branch into `develop` locally.
7. Push the updated `develop` branch (and the feature branch if you want to keep it on the remote).
8. Update TODO.md checkboxes.
9. Stop.

---

## 3. Commit Rules

Format:

```
<type>: short summary
```

Examples:

* `feat: add api auth middleware`
* `fix: correct network peering`
* `hotfix: pin broken image version`

One logical change per commit.

---

## 4. Merge Rules

* Feature/Bugfix → merge into `develop` locally once validation passes, then push `develop`.
* Release → base `develop`, merge to `main` + `develop`
* Hotfix → base `main`, merge to `main` + `develop`

### 4.1 When Codex MAY merge

Codex is allowed to **merge into `develop`** when ALL of the following are true:

* Branch type is **feature/** or **bugfix/**
* All relevant `scripts/*.sh` have been executed successfully
* Lint/tests pass with no errors
* Feature TODO block is fully checked off

After merging:

* Push `develop` (and optionally the feature branch) to the remote
* Update TODO.md checkboxes accordingly

### 4.2 When Codex MUST NOT merge

Codex must **not** merge when:

* Target branch would be `main` (including release/hotfix work) without explicit instruction
* There are failing scripts, linters, or tests
* There are unresolved TODO items for that feature/hotfix

If a PR is still desired for record-keeping (e.g., in Gitea), target `develop` for feature/bugfix branches and include a summary + relevant TODO items.

---

## 5. TODO.md Rules

Agents may:

* Check items off
* Add new tasks **only** inside the same feature block if logically required

Agents may NOT:

* Remove tasks
* Change requirements
* Modify AGENTS.md unless instructed

---

## 6. Script Execution Policy

* Agents **may** run any helpers inside `scripts/*.sh` when cleanup, lint, or test output is required.
* Capture and summarize the command output in responses so the operator understands the results.
* Prefer using the provided helper instead of re-implementing its steps manually.
* Treat successful script output as a prerequisite for merging.

---

## 7. Templates

Feature:

```
## Feature
feature/<slug>
- [ ] task
```

Bugfix:

```
## Bugfix
bugfix/<slug>
- [ ] task
```

Hotfix:

```
## Hotfix
hotfix/<slug>
- [ ] task
```

Release:

```
## Release
release/<version>
- [ ] bump version
```

---

## 8. Agent Mental Model

```
TODO.md → create branch → edit → run scripts → commit → merge into develop → push develop → update TODO → stop
```

---

# 10. Tool-Calling Protocol (STRICT)

The agent MUST obey all rules in this section exactly. Do NOT improvise, omit fields, add fields, or invent paths.

## 10.1 General Rules

* Tool calls MUST be returned as **pure JSON only**. No Markdown, no commentary.
* Tool calls MUST contain a **name** and **parameters** object.
* Tool calls MUST NOT be mixed with assistant text.
* When a tool is required, respond ONLY with the tool call.
* Default workdir is `"."` unless specified otherwise.
* Never invent filesystem paths.

## 10.2 Shell Tool Specification

Required JSON form:

```json
{
  "name": "shell",
  "parameters": {
    "command": ["bash", "-lc", "<COMMAND STRING>"],
    "workdir": ".",
    "justification": "<why this shell call is required>",
    "timeout_ms": 10000,
    "with_escalated_permissions": false
  }
}
```

Rules:

* `<COMMAND STRING>` must be a single string.
* Never output an empty command.
* Never omit the third argument.
* Never use imaginary paths.
* Always include `workdir`.

## 10.3 Apply Patch Specification

```json
{
  "name": "apply_patch",
  "parameters": { "patch": "<UNIFIED DIFF HERE>" }
}
```

Rules:

* Unified diff only.
* Never guess filenames.
* Always include correct headers.

## 10.4 When to Use Tools

* **shell** → running scripts, checking git, listing files, searching
* **apply_patch** → modifying files, updating TODO.md, editing code
* **assistant text** → explanations, plans, summaries

## 10.5 Forbidden Behaviors

* No text + tool mixed.
* No tool calls in fences.
* No imaginary paths.
* No partial JSON.
* No destructive commands unless explicitly requested.

---

# 11. Context Shepherd (Meta-Agent)

The Context Shepherd governs workflow order, consistency, and state awareness. It ensures stable, linear progress and prevents unfinished work from being abandoned.

## 11.1 Purpose

Maintain project consistency by evaluating repository state, choosing safe next steps, preventing context drift, and managing merge readiness.

## 11.2 Activation

Triggered when user requests:

* “begin work”
* “next task”
* “continue”
* On interrupted work

The Shepherd overrides normal behavior until environment is stable.

## 11.3 Responsibilities

### State Evaluation

* Check active branches
* Review TODO.md
* Verify merge/PR status (if any)
* Check script results

### State Snapshot

Outputs 2–4 line summary:

* Active branch
* Last success/failure
* Next atomic step
* Whether path is blocked

### Next Atomic Step

* Continue feature work
* Fix failing scripts
* Merge if safe
* Complete remaining TODO
* Start new feature only when repo is clean

### Merge Safety Gate

Merge into develop only when:

* Working branch is feature/* or bugfix/*
* scripts/* helpers have been run and passed
* Lint/tests pass
* Relevant TODO items are complete

After merging, push `develop` so the remote matches local state.

### Task Resumption

Reconstructs context from:

* branch state
* TODO.md
* commits
* script output

### Drift Prevention

If unfinished branch exists: **block new work**.

### Failure → TODO Conversion

Failed scripts generate TODO entries.

---

# 12. Forest Mode (Multi-Repo Orchestration)

Agents may operate in a parent folder containing many git repos.

## 12.1 Discovery

Scan all subfolders; any with `.git/` are repos.

## 12.2 Multi-Repo Task Targeting

Tasks may specify repo:

```
- [ ] (backend) implement endpoint
```

If not specified, Codex determines target repo.

## 12.3 Branch Naming

For multi-repo features: use same branch name across repos.

## 12.4 Atomic Step Execution

1. Evaluate all repos.
2. Select next atomic task.
3. `cd` into repo.
4. Execute steps.
5. Commit, push, PR.

## 12.5 Merge Coordination

Repos may merge into develop independently but feature completes only when all repos’ PRs merge.

## 12.6 Snapshot

Example:

```
Repos: backend, frontend, infra
Active:
  backend: feature/prof (pass)
  frontend: feature/prof (lint fail)
Next: fix frontend lint
```

## 12.7 Failure Handling

Any repo failure blocks overall feature.

## 12.8 Starting Multi-Repo Features

Create branches in each repo, generate TODO stubs, proceed.

## 12.9 Forbidden

* No cross-repo edits without context
* No merges to main
* No branch deletion

---

# End of AGENTS.md
