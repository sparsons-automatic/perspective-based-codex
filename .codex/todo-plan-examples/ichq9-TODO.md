# ICH Q9 TODO

## Feature: ichq9-risk-framework
feature/ichq9-framework
- [ ] Define risk categories in schema (security, availability, data integrity).
- [ ] Add scoring model for likelihood + impact.
- [ ] Require risk evaluation for all components in plan output.
- [ ] Store risk results for audit evidence.

## Feature: ichq9-risk-controls
feature/ichq9-controls
- [ ] Map each infrastructure control to risk mitigations.
- [ ] Validate mitigations are enabled (encryption, logging, private endpoints, etc.).
- [ ] Add validator warning for unmitigated risks.
- [ ] Add summary to preview output.

## Feature: ichq9-periodic-review
feature/ichq9-review
- [ ] Schedule periodic risk re-evaluation triggers.
- [ ] Add validator to detect configuration drift that affects risk posture.
- [ ] Store review reports in evidence archive.

## Feature: ichq9-capa
feature/ichq9-capa
- [ ] Add schema for Corrective & Preventive Action tracking.
- [ ] Validate CAPA items resolved before deployment to validated environments.
- [ ] Store remediation logs as evidence.

