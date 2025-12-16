# Using Codex Perspectives (Human Guide)

This document is for **humans**.

It explains how to *work with Codex* using perspectives in a relaxed, conversational way — without memorizing rules or rewriting intent every time.

Think of perspectives as **mental modes** you can ask Codex to step into.

---

## The Mental Model

You are not issuing commands.
You are **inviting a perspective into the conversation**.

A perspective:

* does *not* execute code
* does *not* change state
* does *not* replace you

It observes, reasons, and responds **within clearly defined boundaries**.

You stay in control.

---

## The Perspective Pipeline (Simple)

Most productive workflows follow this shape:

1. **Create or modify work** (Codex in normal mode)
2. **Translate obligations** (ComplianceTranslator, if needed)
3. **Assess risk and assumptions** (SecurityInvestigator)
4. **Sense timing and release posture** (ProjectManagerNavigator)
5. **Decide and act** (you)

You do *not* need to use every perspective every time.

---

## How to Invoke a Perspective

You can invoke a perspective in three easy ways:

### 1. By Name (casual)

> "As SecurityInvestigator, what risks should I think about here?"

### 2. By File Path (explicit)

> "Use `.codex/perspectives/ProjectManagerNavigator.md` and tell me if this feels release-ready."

### 3. By Contextual Hint (soft)

> "From a compliance translation point of view, what work does this imply?"

If Codex misunderstands, just restate the role.
No ceremony required.

---

## What to Provide as Input

Perspectives are **input-sensitive**.

Good inputs include:

* Todo summaries
* Architecture notes
* Commit titles or branch lists
* Design decisions in plain language

Bad inputs include:

* "Just check everything"
* Raw repositories with no framing

If a perspective lacks input, it should say so.

---

## Example: Building a Small FastAPI Service

Below is a **human-paced example** of using perspectives while building a simple FastAPI app with Codex.

---

### Step 1: Scaffold the App (Normal Codex)

> "Help me scaffold a minimal FastAPI app with one health endpoint."

**What Codex does**:

* Generates a basic FastAPI app structure
* Adds a `/health` endpoint
* Explains how to run it locally

At this point, no perspective is needed.

---

### Step 2: Add a Feature (Normal Codex + Todo)

You decide to add a real feature.

> "I want to add a `/notes` endpoint that stores notes in MongoDB. Create a todo and scaffold the code."

**What Codex does**:

* Proposes or creates a feature todo (e.g. `feature/add-notes-endpoint`)
* Scaffolds models, routes, and basic persistence
* Keeps scope intentionally minimal

You review and adjust as needed.

---

### Step 3: Compliance Translation (Optional)

Before going further:

> "Using ComplianceTranslator, what compliance or policy work might this new notes feature imply?"

**What Codex does**:

* Identifies data storage and retention concerns
* Suggests draft todos (logging, access control, deletion)
* Notes overlapping controls across frameworks

Nothing is enforced. You choose what applies.

---

### Step 4: Security Review (Before Exposure)

Before exposing the endpoint publicly:

> "As SecurityInvestigator, review the `/notes` feature and call out risks or assumptions."

**What Codex does**:

* Surfaces attack surface (auth, input validation, injection)
* Calls out assumptions ("notes are non-sensitive")
* Suggests follow-up security tasks

No blocking. Just visibility.

---

### Step 5: Direction & Release Check

As features accumulate:

> "Using ProjectManagerNavigator, does this notes feature push us toward a release boundary?"

**What Codex does**:

* Assesses scope creep vs milestone progress
* Suggests branch or release timing
* Reminds you to consider client downtime or migrations

---

### Step 6: Decide & Act

You:

* refine the feature
* add or defer tasks
* merge or hold the branch
* cut a release when ready

Perspectives inform.
You decide.

---

## When *Not* to Use Perspectives

Do **not** use perspectives for:

* Writing code
* Debugging syntax errors
* Running commands
* Making irreversible changes

Use them when:

* decisions feel fuzzy
* risk is increasing
* scope is drifting
* releases are looming

---

## Common Patterns

### Lightweight Daily Check

> "As ProjectManagerNavigator, summarize today’s progress and risks."

### Pre-Release Pass

> "Run SecurityInvestigator and ProjectManagerNavigator on the current state."

### Compliance Planning

> "Translate PCI requirements into a todo plan for this repo."

---

## If Codex Gets Weird

Just say:

> "Stay within the perspective constraints. Do not execute or modify anything."

Or:

> "That’s outside this perspective’s scope — please stop."

Perspectives are guardrails, not shackles.

---

## Final Thought

Perspectives exist to:

* reduce cognitive load
* surface blind spots
* make decisions calmer

They are **tools for thinking**, not authority structures.

Use them lightly.
Trust yourself.
