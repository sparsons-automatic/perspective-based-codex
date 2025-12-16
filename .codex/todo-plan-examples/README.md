# Todo Plan Examples

This directory contains **ready-made Todo API plans** that demonstrate how to translate compliance frameworks, operating models, or bespoke initiatives into Codex-friendly work blocks. Each markdown file mirrors the structure Codex expects inside `TODO.md`: Feature/Bugfix sections tied to branch names plus scoped checklists. By copying one of these files (or cherry-picking sections) you can bootstrap a repository’s TODO catalog without drafting everything from scratch.

## Available Templates

| File | Source / Theme | Highlights |
| --- | --- | --- |
| `21cfr11-TODO.md` | 21 CFR Part 11 (electronic records & signatures) | Validation, audit trails, user authentication, record retention. |
| `ASBv3-TODO.md` | Azure Security Benchmark v3 | Logging, RBAC, network hardening, key management. |
| `gamp5-TODO.md` | GAMP 5 (GxP system validation) | Lifecycle controls, change management, testing evidence. |
| `hipaa-TODO.md` | HIPAA Security Rule | PHI safeguards, access controls, audit logging, contingency planning. |
| `ichq9-TODO.md` | ICH Q9 Quality Risk Management | Risk evaluations, mitigation tracking, monitoring loops. |
| `iso27001-TODO.md` | ISO/IEC 27001 Annex A controls | Organizational security, asset management, cryptography, suppliers. |
| `nist80053-TODO.md` | NIST 800-53 Moderate baseline | Access, auditing, incident response, contingency planning. |
| `nist-csf-TODO.md` | NIST Cybersecurity Framework | Identify/Protect/Detect/Respond/Recover swimlanes. |
| `pci-TODO.md` | PCI-DSS | Logging, encryption, network segmentation, change monitoring. |
| `soc1-TODO.md` | SOC 1 (Trust Services) | Control narratives, evidence capture, operational monitoring. |
| `soc2-TODO.md` | SOC 2 (Security/Availability/Confidentiality) | Policies, metrics, response workflows, vendor review. |
| `new-project-TODO.md` | Blank starter | Generic feature scaffolding for net-new repos. |

> Tip: Browse these files directly to copy entire feature blocks or individual checklist items into your project’s `TODO.md`.

## How the Plans Are Structured

Each file follows the same pattern:

1. `## Feature | Bugfix | Release | Hotfix` heading describing the work theme.
2. Branch naming hint (e.g., `feature/pci-logging`) to keep Git flow consistent.
3. A checklist of tasks Codex can execute or review, phrased as ready-to-run action items.

Because Codex agents rely on checkbox state to guide work, the examples focus on:

- **Atomic scope** – each checklist item is testable/verifiable on its own.
- **Clear acceptance** – mention validations, scripts, or evidence expectations.
- **Balanced coverage** – mix engineering, documentation, and validation tasks so compliance intent is preserved.

## Building Your Own Plan

1. **Pick the nearest template** – start from the framework that matches your needs or from `new-project-TODO.md`.
2. **Rename sections to match your features** – keep the `Feature:` headings but swap slugs, ensuring each maps to a Git branch per `AGENTS.md`.
3. **Translate requirements into tasks** – follow the ComplianceTranslator perspective: reference control IDs, list acceptance criteria, and keep work units tight.
4. **Layer validators and evidence** – explicitly mention scripts, logs, or artifacts operators should produce; this keeps audits defensible.
5. **Link related frameworks** – if a task satisfies PCI + ISO, note it parenthetically so you can avoid duplicate work later.

Treat these plans as living documents. As Codex finishes items, mirror the state in `TODO.md` so future agents pick up where you left off.

## Using Plans with Codex

1. **Seed `TODO.md`** – Copy the relevant sections into the repo’s root `TODO.md`. Codex agents always scan that file first per AGENTS.md.
2. **Follow the Git-flow tie-in** – Each block assumes a matching branch name. Create the branch before starting work to keep automation predictable.
3. **Reference scripts** – If a task mentions validators (e.g., `scripts/lint.sh`, custom checks), ensure those scripts exist or add them so Codex can fulfill acceptance criteria.
4. **Update checkboxes religiously** – Agents rely on checkbox state to know what’s left. Check off items only after validation passes.
5. **Capture deltas** – When frameworks evolve, edit the corresponding plan and redistribute to dependent repos. Keep this README in sync if you add new templates.

By curating high-quality Todo plans here, you keep compliance-heavy projects moving quickly: operators can spin up branches with confidence, Codex knows exactly what “done” looks like, and auditors inherit a ready-made trace of intent → work → evidence.
