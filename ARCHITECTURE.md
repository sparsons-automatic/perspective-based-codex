# ARCHITECTURE.md

This document describes system structure and responsibility boundaries.
It is intended for humans and agents to make safe, localized changes.

This file defines **what lives where**.
It does NOT define workflow or permissions (see AGENTS.md).

---

## 1. Architectural Principles (Invariant)

- Explicit configuration over positional arguments
- Clear ownership of side effects
- Long-running work is isolated
- UI layers observe state; workers mutate state
- Artifacts are durable and inspectable

These principles must hold for all changes.

---

## 2. Responsibility Boundaries (Invariant)

Each component owns exactly one category of responsibility.

Rules:
- No cross-layer shortcuts
- No hidden state mutation
- No duplicate persistence paths
- No network calls outside designated clients

Violations require refactoring, not exceptions.

---

## 3. Component Types (Invariant)

Most projects will map onto some subset of these roles:

### 3.1 Interface Layer
Collects user intent and renders state.
Must remain responsive and side-effect free.

### 3.2 Orchestration Layer
Coordinates workflows and lifecycle.
May enqueue or dispatch work but does not perform it.

### 3.3 Worker / Executor Layer
Performs long-running or external actions.
Sole owner of mutation and side effects.

### 3.4 Persistence Layer
Reads and writes durable artifacts.
Must tolerate missing or partial data.

### 3.5 Client Layer
Encapsulates all external APIs or services.
No other layer may talk to the outside world.

---

## 4. Project-Specific Component Map (EDIT THIS)

| Component | Role |
|---------|------|
| CLI / UI | Interface |
| Background worker | Executor |
| Stable Diffusion client | Client |
| Filesystem store | Persistence |

This table is the **only project-specific section**.

---

## 5. Data & State Model (Mostly Invariant)

- Artifacts are the source of truth
- Reads must tolerate missing/corrupt state
- Partial writes are expected
- State should be reconstructable from disk

Databases are optional; durability is not.

---

## 6. Extension Rules (Invariant)

When adding features:
1. Identify the owning layer
2. Add helpers before flags
3. Prefer new modules over expanding god-functions
4. Update this document if boundaries change

If unsure, do less.

---

## 7. What This Document Is NOT

- A user guide
- A workflow description
- A replacement for TODO.md
- A list of commands

Those belong elsewhere.

---

End of document.
