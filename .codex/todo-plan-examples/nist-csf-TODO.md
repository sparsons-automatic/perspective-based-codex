# NIST CSF TODO

## Feature: nist-csf-identify
feature/nist-identify
- [ ] Add asset inventory generation for all resources.
- [ ] Classify resources based on data sensitivity.
- [ ] Validate missing identity mappings in schema.

## Feature: nist-csf-protect
feature/nist-protect
- [ ] Validate encryption in transit + at rest.
- [ ] Enforce RBAC + least privilege access.
- [ ] Require private endpoints for internal services.
- [ ] Add validator checking patch level of core services.

## Feature: nist-csf-detect
feature/nist-detect
- [ ] Enable monitoring for abnormal activity.
- [ ] Route alerts to configured incident channels.
- [ ] Validate diagnostic logs for required event categories.

## Feature: nist-csf-respond
feature/nist-respond
- [ ] Add schema block for incident response contacts.
- [ ] Validate logging supports forensic investigations.
- [ ] Provide automated incident evidence collection.

## Feature: nist-csf-recover
feature/nist-recover
- [ ] Define recovery objectives (RPO/RTO) in schema.
- [ ] Validate backup coverage for all critical systems.
- [ ] Add automated restore testing workflow.
- [ ] Store recovery test results in long-term storage.

