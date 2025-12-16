# 21 CFR Part 11 TODO

## Feature: 21cfr11-authentication
feature/21cfr11-auth
- [ ] Enforce MFA for all user access.
- [ ] Validate unique user identity for all admin actions.
- [ ] Add validators preventing shared accounts.
- [ ] Add schema block for identity-proofing requirements.

## Feature: 21cfr11-audit-trails
feature/21cfr11-audit
- [ ] Enable tamper-evident audit logs for all changes.
- [ ] Validate that logs capture who/what/when.
- [ ] Add hashing for immutability verification.
- [ ] Store audit logs in immutable storage (WORM if required).

## Feature: 21cfr11-record-integrity
feature/21cfr11-record-integrity
- [ ] Require CMK encryption for all controlled data stores.
- [ ] Add time-synchronization validators for all services.
- [ ] Validate consistent timestamping of logs and events.

## Feature: 21cfr11-electronic-signatures
feature/21cfr11-signatures
- [ ] Add schema support for “review/approval” steps that require signatures.
- [ ] Ensure signatures are tied to unique user credentials.
- [ ] Validate signature logs include timestamp + meaning of signature.

## Feature: 21cfr11-system-validation
feature/21cfr11-validation
- [ ] Add validator ensuring tested/validated components in “validated” environments.
- [ ] Store system validation evidence (IQ/OQ/PQ) in long-term retention.
- [ ] Validate cloud services used are version-pinned when required.

