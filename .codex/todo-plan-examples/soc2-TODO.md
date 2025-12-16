# SOC2 TODO

## Feature: soc2-security-baseline
feature/soc2-security-baseline
- [ ] Enforce MFA for all administrative access.
- [ ] Validate least-privilege RBAC across Azure resources.
- [ ] Require workload identity for AKS pods.
- [ ] Add validators for unused public endpoints.
- [ ] Add CMK enforcement for all data stores.

## Feature: soc2-logging-monitoring
feature/soc2-logging
- [ ] Enable diagnostic logs for compute, storage, identity, networking.
- [ ] Validate log retention >= 1 year.
- [ ] Add monitoring for service availability and error rates.
- [ ] Add schema block for alert routing + escalation policy.
- [ ] Provide Pulumi component for automatic Azure Monitor dashboards.

## Feature: soc2-availability
feature/soc2-availability
- [ ] Ensure AKS cluster has multi-zone or node-redundant configuration.
- [ ] Add schema for uptime targets (SLOs) per service.
- [ ] Validate backup policies for all persistent data.
- [ ] Enable auto-scaling for compute resources where applicable.
- [ ] Add validator to verify no single points of failure.

## Feature: soc2-confidentiality
feature/soc2-confidentiality
- [ ] Require encryption in transit + at rest for all data paths.
- [ ] Validate private endpoints for internal services.
- [ ] Add schema field for data classification.
- [ ] Enforce key rotation schedule for CMKs.
- [ ] Validators: ensure all sensitive data is stored in encrypted stores.

## Feature: soc2-change-management
feature/soc2-change-mgmt
- [ ] Require reviewed + approved PRs for infrastructure changes.
- [ ] Capture Pulumi preview/apply logs as evidence artifacts.
- [ ] Store CI/CD run logs in long-term retention storage.
- [ ] Validate versioning + rollback capability for services.
