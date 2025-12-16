# SOC1 TODO

## Feature: soc1-audit-support
feature/soc1-audit-support
- [ ] Store pipeline logs for sufficient retention for audit periods.
- [ ] Add schema block for financial-system tagging if applicable.
- [ ] Validate logging completeness for services supporting financial processes.

## Feature: soc1-access-separation
feature/soc1-access-separation
- [ ] Ensure RBAC separation between operators and financial-app components.
- [ ] Validators: verify no admin-level access for app-only identities.
- [ ] Require MFA for personnel with financial-system access.

## Feature: soc1-change-evidence
feature/soc1-change-evidence
- [ ] Capture evidence of reviewed + approved changes to infra.
- [ ] Add validator ensuring every deploy includes an audit-trace artifact.
- [ ] Retain change logs >= audit cycle length.

## Feature: soc1-data-integrity-support
feature/soc1-integrity
- [ ] Enable Cosmos DB integrity checks (point-in-time restore, backups).
- [ ] Validate storage immutability for financial logs if required.
