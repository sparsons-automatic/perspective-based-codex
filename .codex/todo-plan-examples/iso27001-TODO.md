# ISO27001 TODO

## Feature: iso-access-control
feature/iso-access-control
- [ ] Ensure RBAC applied consistently across Azure resources.
- [ ] Add schema block for identity roles.
- [ ] Validate least-privilege for users and service principals.
- [ ] Restrict admin scopes + require MFA.
- [ ] Validators: enforce workload identity in AKS.

## Feature: iso-logging-monitoring
feature/iso-logging
- [ ] Enable diagnostic logs for all core services.
- [ ] Validate log completeness + retention >= 1 year.
- [ ] Add health + monitoring components for AKS, Cosmos, VNet.
- [ ] Provide monitoring dashboard definitions.

## Feature: iso-change-management
feature/iso-change-mgmt
- [ ] Require reviewed PRs before infrastructure changes.
- [ ] Store Pulumi preview + apply results as artifacts.
- [ ] Add plan validator requiring preview logs.
- [ ] Enforce versioning structure for environments.

## Feature: iso-backup-continuity
feature/iso-backup
- [ ] Define backup policies for Cosmos, Storage, AKS state.
- [ ] Add schema fields for RPO/RTO values.
- [ ] Add Pulumi automation for enabling backup configs.
- [ ] Validators: confirm backup coverage + retention.

## Feature: iso-risk-mgmt
feature/iso-risk
- [ ] Add component for generating compliance report.
- [ ] Validate encryption, network, and identity controls.
- [ ] Provide summary of violations during `plan`.
