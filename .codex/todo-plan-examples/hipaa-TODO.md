# HIPAA TODO

## Feature: hipaa-access-control
feature/hipaa-access-control
- [ ] Enforce unique user authentication for all access paths.
- [ ] Require MFA for PHI-related systems.
- [ ] Validate least-privilege RBAC for all identities.
- [ ] Enforce workload identity usage for AKS pods.
- [ ] Validators: ensure no shared secrets/service accounts.

## Feature: hipaa-audit-logging
feature/hipaa-audit
- [ ] Enable PHI-access logging across AKS, Cosmos, Storage, App Services.
- [ ] Validate audit log completeness + tamper-resistant storage.
- [ ] Ensure log retention policies meet HIPAA guidelines.
- [ ] Provide report summarizing audit log configuration per environment.

## Feature: hipaa-encryption
feature/hipaa-encryption
- [ ] Enforce TLS across all services handling PHI.
- [ ] Validate encryption-at-rest for Cosmos, Storage, databases.
- [ ] Require Key Vault-backed CMKs for PHI systems.
- [ ] Add key rotation automation schedule + validator.

## Feature: hipaa-transmission-security
feature/hipaa-transmission-security
- [ ] Validate that PHI never crosses public endpoints unencrypted.
- [ ] Require Private DNS + Private Endpoints for internal services.
- [ ] Add validator ensuring no inadvertent ingress routes expose PHI.

## Feature: hipaa-data-integrity
feature/hipaa-integrity
- [ ] Enable point-in-time restore + backup for PHI data stores.
- [ ] Validate use of hashing or integrity checks for PHI archives.
- [ ] Add schema field to classify PHI vs non-PHI data.

## Feature: hipaa-disaster-recovery
feature/hipaa-dr
- [ ] Define RPO/RTO requirements in schema.
- [ ] Validate backup coverage for all PHI systems.
- [ ] Provide automated restore testing plan.
