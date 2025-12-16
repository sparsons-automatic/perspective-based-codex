# Azure Security Benchmark (ASB) — TODO

---

## Feature: Network Security
feature/asb-network-security

### NS-1: Establish network segmentation boundaries
- [ ] Assess existing VNets/subnets and segmentation strategy
- [ ] Document allowed traffic flows and boundaries
- [ ] Implement segmentation policies (NSGs, Firewall rules)

### NS-2: Secure cloud services with network controls
- [ ] Identify services lacking network restriction
- [ ] Apply IP restrictions / private endpoints where appropriate

### NS-3: Deploy firewall at the edge of enterprise network
- [ ] Evaluate Azure Firewall applicability
- [ ] Deploy and configure if required

### NS-4: Deploy IDS/IPS
- [ ] Assess need for IDS/IPS coverage
- [ ] Enable threat detection / IDS options

### NS-5: Deploy DDOS protection
- [ ] Determine tier needed
- [ ] Enable DDOS Protection Plan if applicable

### NS-6: Deploy web application firewall
- [ ] Identify apps needing WAF
- [ ] Configure WAF (App Gateway / Front Door)

### NS-7: Simplify network security configuration
- [ ] Review rules for redundancy/complexity
- [ ] Standardize network rulesets

### NS-8: Detect and disable insecure protocols
- [ ] Scan for insecure services
- [ ] Disable or replace deprecated protocols

### NS-9: Connect networks privately
- [ ] Ensure private connectivity (private endpoints, VPN, ExpressRoute)
- [ ] Audit public exposure

### NS-10: Ensure DNS security
- [ ] Evaluate Azure DNS/Private DNS setup
- [ ] Enable DNS logging & secure resolution paths

---

## Feature: Identity Management
feature/asb-identity-management

### IM-1: Use centralized identity and authentication system
- [ ] Confirm Azure AD as primary identity provider
- [ ] Migrate legacy auth where needed

### IM-2: Protect identity and authentication systems
- [ ] Enable conditional access
- [ ] Harden authentication flows

### IM-3: Manage application identities securely
- [ ] Replace secrets with managed identities
- [ ] Audit service principals

### IM-4: Authenticate servers and services
- [ ] Enforce certificate or identity-based service auth

### IM-5: Use SSO for application access
- [ ] Integrate apps with Azure AD SSO

### IM-6: Use strong authentication controls
- [ ] Enforce MFA
- [ ] Eliminate legacy auth flows

### IM-7: Restrict resource access based on conditions
- [ ] Implement conditional access policies

### IM-8: Restrict exposure of credentials & secrets
- [ ] Audit config for hardcoded secrets
- [ ] Move secrets to Key Vault

### IM-9: Secure user access to existing applications
- [ ] Validate user permissions
- [ ] Apply least privilege

---

## Feature: Privileged Access
feature/asb-privileged-access

### PA-1: Separate and limit highly privileged users
- [ ] Identify high-priv accounts
- [ ] Restrict roles

### PA-2: Avoid standing access
- [ ] Implement PIM (Privileged Identity Management)

### PA-3: Manage lifecycle of identities
- [ ] Lifecycle policies for users/groups/SPNs

### PA-4: Review and reconcile access regularly
- [ ] Quarterly access review

### PA-5: Set up emergency access
- [ ] Configure break-glass accounts

### PA-6: Use privileged access workstations
- [ ] Identify and implement PAW model

### PA-7: Follow least privilege
- [ ] Audit role assignments
- [ ] Remove excessive privileges

### PA-8: Define cloud provider support access process
- [ ] Document Azure support access policy

---

## Feature: Data Protection
feature/asb-data-protection

### DP-1: Discover, classify, and label sensitive data
- [ ] Identify sensitive data locations
- [ ] Apply Azure Information Protection labels

### DP-2: Monitor anomalies targeting sensitive data
- [ ] Enable data access anomaly detection

### DP-3: Encrypt data in transit
- [ ] Require TLS everywhere

### DP-4: Enable data at rest encryption by default
- [ ] Ensure platform encryption enabled on all resources

### DP-5: Customer-managed keys when required
- [ ] Move critical workloads to CMK

### DP-6: Secure key management
- [ ] Validate Key Vault policies

### DP-7: Secure certificate management
- [ ] Centralize certs & enforce expiration policies

### DP-8: Ensure security of key & cert repository
- [ ] Audit Key Vault access

---

## Feature: Asset Management
feature/asb-asset-management

### AM-1: Track asset inventory
- [ ] Build automated inventory list

### AM-2: Use only approved services
- [ ] Audit resource types in use

### AM-3: Ensure secure lifecycle management
- [ ] Validate onboarding/offboarding process

### AM-4: Limit access to asset management
- [ ] Restrict asset management roles

### AM-5: Approved applications in VM
- [ ] Validate VM application baseline

---

## Feature: Logging & Threat Detection
feature/asb-logging-threat-detection

### LT-1: Enable threat detection
- [ ] Turn on Azure Defender plans where applicable

### LT-2: Threat detection for identity
- [ ] Enable Identity Protection signals

### LT-3: Logging for investigation
- [ ] Enable resource logs

### LT-4: Network logging
- [ ] Enable NSG flow logs

### LT-5: Centralize log management
- [ ] Route logs to Log Analytics

### LT-6: Configure log retention
- [ ] Set consistent retention policies

### LT-7: Approved time sources
- [ ] Validate NTP configuration

---

## Feature: Incident Response
feature/asb-incident-response

### IR-1: Update IR plan & process
- [ ] Review IR documentation

### IR-2: Setup incident notification
- [ ] Configure alert routing

### IR-3: High-quality alert generation
- [ ] Tune alert rules

### IR-4: Investigate incidents
- [ ] Document investigation workflow

### IR-5: Prioritize incidents
- [ ] Define severity mapping

### IR-6: Automate incident handling
- [ ] Build automation rules/playbooks

### IR-7: Post-incident lessons learned
- [ ] Define RCA process

---

## Feature: Posture & Vulnerability Management
feature/asb-posture-vulnerability

### PV-1: Define secure configurations
- [ ] Establish configuration baselines

### PV-2: Enforce secure configurations
- [ ] Apply Azure Policy

### PV-3: Secure compute resource configs
- [ ] Define per-service compute standards

### PV-4: Enforce compute standards
- [ ] Add compute-specific policies

### PV-5: Vulnerability assessments
- [ ] Enable VA tools

### PV-6: Automatic remediation
- [ ] Implement patching automation

### PV-7: Red team operations
- [ ] Schedule annual engagements

---

## Feature: Endpoint Security
feature/asb-endpoint-security

### ES-1: Use EDR
- [ ] Ensure Defender for Endpoint coverage

### ES-2: Use modern anti-malware
- [ ] Validate VM anti-malware setup

### ES-3: Ensure signatures updated
- [ ] Verify update pipeline

---

## Feature: Backup & Recovery
feature/asb-backup-recovery

### BR-1: Regular automated backups
- [ ] Confirm backups on critical workloads

### BR-2: Protect backup data
- [ ] Enforce immutability & isolation

---

## Feature: DevOps Security
feature/asb-devops-security

### DS-1: Threat modeling
- [ ] Integrate threat modeling into design

### DS-2: Supply chain security
- [ ] Validate package signing & provenance

### DS-3: Secure DevOps infrastructure
- [ ] Harden build agents & pipelines

### DS-4: Static analysis (SAST)
- [ ] Ensure code scanning in CI

### DS-5: Dynamic analysis (DAST)
- [ ] Enable dynamic security testing

### DS-6: Workload security lifecycle
- [ ] Define workload lifecycle controls

### DS-7: Logging & monitoring for DevOps
- [ ] Capture pipeline logs centrally

---

## Feature: Governance & Strategy
feature/asb-governance-strategy

### GS-1: Roles & responsibilities
- [ ] Document ownership matrix

### GS-2: Segmentation / separation of duties
- [ ] Define role separation strategy

### GS-3: Data protection strategy
- [ ] Create documented data protection approach

### GS-4: Network security strategy
- [ ] Define enterprise network security strategy

### GS-5: Security posture strategy
- [ ] Document posture management approach

### GS-6: Identity & privileged access strategy
- [ ] Document IAM strategy

### GS-7: Logging, detection & IR strategy
- [ ] Document unified logging strategy

### GS-8: Backup strategy
- [ ] Create enterprise backup plan

### GS-9: Endpoint security strategy
- [ ] Define VM/host protection strategy

### GS-10: DevOps security strategy
- [ ] Document DevOps security vision
