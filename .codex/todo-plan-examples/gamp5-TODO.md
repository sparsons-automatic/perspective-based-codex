# GAMP5 TODO

## Feature: gamp-system-lifecycle
feature/gamp-system-lifecycle
- [ ] Define lifecycle stages (requirements → design → build → test → release) in schema.
- [ ] Add validator ensuring environment definitions are version-controlled.
- [ ] Ensure Pulumi plan + apply logs become lifecycle evidence artifacts.
- [ ] Add component for generating system documentation stubs.

## Feature: gamp-config-control
feature/gamp-config-control
- [ ] Require all configuration to be stored in Git repositories.
- [ ] Validate no unmanaged/manual configuration paths.
- [ ] Add schema flag for “validated system” handling.
- [ ] Add automated config baseline snapshot generation.

## Feature: gamp-change-control
feature/gamp-change-control
- [ ] Require PR-based approval workflow for infra changes.
- [ ] Store diff summaries as change-control evidence.
- [ ] Add validator enforcing preview-before-apply.
- [ ] Retain change logs according to GxP policies.

## Feature: gamp-data-integrity
feature/gamp-data-integrity
- [ ] Enforce ALCOA+ principles via validators (Attributable, Legible, Contemporaneous, Original, Accurate).
- [ ] Enable tamper-evident log storage.
- [ ] Add hashing for configuration archives.
- [ ] Validate backup logs + restore testing evidence.

## Feature: gamp-testing-iq-oq-pq
feature/gamp-testing
- [ ] Auto-generate IQ/OQ baseline templates.
- [ ] Create validators for environment provisioning steps.
- [ ] Add schema block for validation-required environments.
- [ ] Store IQ/OQ logs in controlled evidence storage.

## Feature: gamp-evidence-store
feature/gamp-evidence
- [ ] Add component for uploading logs/artifacts to long-term storage.
- [ ] Validate retention periods.
- [ ] Generate metadata for audit retrieval.
