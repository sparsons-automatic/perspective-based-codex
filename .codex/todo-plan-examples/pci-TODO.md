# PCI-DSS TODO

## Feature: pci-logging
feature/pci-logging
- [ ] Add diagnosticSettings for AKS, VNets, NSGs, Cosmos DB, Storage, ACR.
- [ ] Ensure log retention >= 1 year.
- [ ] Add validation checks in plan.py.
- [ ] Add schema fields for log retention settings.
- [ ] Validate logs route to Log Analytics + cold storage.

## Feature: pci-encryption
feature/pci-encryption
- [ ] Enforce HTTPS/TLS on all public endpoints.
- [ ] Enable CMK (customer-managed keys) for Cosmos DB.
- [ ] Add Pulumi component for Key Vault + CMK wiring.
- [ ] Enforce encryption-at-rest on all storage accounts.
- [ ] Validators: confirm CMK and secure TLS settings.

## Feature: pci-network-restrictions
feature/pci-net-sec
- [ ] Define required NSG rule blocks in schema.
- [ ] Validate NSG rules follow least privilege.
- [ ] Enforce deny-by-default outbound for build agents.
- [ ] Require Private Endpoints for ACR, Cosmos, Storage.
- [ ] Validators: ensure no unintended public exposure.

## Feature: pci-access-control
feature/pci-access-control
- [ ] Enforce role-based access boundaries for admin accounts.
- [ ] Add schema support for RBAC mappings.
- [ ] Validate separation of duties across DevOps + apps.
- [ ] Require MFA for admin access.
- [ ] Validators: no Owner/Contributor use by services.

## Feature: pci-change-monitoring
feature/pci-change-monitoring
- [ ] Capture change logs from pipelines + Pulumi runs.
- [ ] Store change evidence in long-term archival.
- [ ] Add plan validator ensuring preview-before-apply.
- [ ] Add audit summary to plan output.
