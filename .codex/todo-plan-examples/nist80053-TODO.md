# NIST 800-53 TODO

## Feature: nist-au-audit-controls
feature/nist-au-controls
- [ ] Enable audit logs for all major components.
- [ ] Route logs to Log Analytics + immutable storage.
- [ ] Add integrity checks (e.g., hashing for archives).
- [ ] Validators: retention >= 365 days.

## Feature: nist-ac-access-control
feature/nist-ac
- [ ] Enforce AAD auth everywhere (AKS, Cosmos, Storage).
- [ ] Require least-privilege role mapping in schema.
- [ ] Validate separation of user/admin identities.
- [ ] Require workload identity on AKS.

## Feature: nist-sc-communications
feature/nist-sc
- [ ] Enforce TLS for all ingress + API services.
- [ ] Validate private link usage for all internal services.
- [ ] Add validator ensuring no public IP exposure.

## Feature: nist-cm-config-management
feature/nist-cm
- [ ] Validate infrastructure drift detection via Pulumi.
- [ ] Require PR-based approvals for infra changes.
- [ ] Store change artifacts for audit trail.
- [ ] Add validator ensuring config versioning is enabled.

## Feature: nist-ir-incident-response
feature/nist-ir
- [ ] Provide mechanism for routing alerts from Azure Monitor.
- [ ] Add schema block for incident contacts + thresholds.
- [ ] Validate incident logging completeness.
