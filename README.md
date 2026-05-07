# Microsoft Entra ID Identity Hardening Project

![Identity](https://img.shields.io/badge/Identity-Microsoft%20Entra%20ID-5E5ADB)
![Security](https://img.shields.io/badge/Security-Conditional%20Access-008272)
![PIM](https://img.shields.io/badge/Access-PIM-7C3AED)
![MFA](https://img.shields.io/badge/Auth-Multi--Factor%20Authentication-0078D4)
![Monitoring](https://img.shields.io/badge/Monitoring-Sign--In%20Logs-2563EB)
![Audit](https://img.shields.io/badge/Audit-Audit%20Logs-0F766E)
![Scripting](https://img.shields.io/badge/Scripting-PowerShell-5391FE)

---

## Overview

This project focuses on strengthening identity and access security using Microsoft Entra ID security features such as Conditional Access, Privileged Identity Management (PIM), Multi-Factor Authentication (MFA), and identity monitoring.

The environment simulates real-world identity protection scenarios and validates secure administrative access practices.

---

## Objectives

The project includes:

- Conditional Access policy configuration
- MFA enforcement and testing
- Privileged role assignment using PIM
- Risky sign-in monitoring
- Sign-in and audit log analysis
- Secure user and group management

---

## Technologies Used

- Microsoft Entra ID
- Conditional Access Policies
- Privileged Identity Management (PIM)
- Multi-Factor Authentication (MFA)
- Azure Sign-In Logs
- Azure Audit Logs
- PowerShell

---

## Step 1 — Security Group and User Setup

Created test users and a dedicated security group for Conditional Access policy targeting.

### Objects Created

| Type | Name |
|---|---|
| User | `demo-user1` |
| User | `demo-user2` |
| Group | `grp-security-testers` |

### Validation

- Users added successfully to security group
- Group used later for Conditional Access targeting

![Users Created](./Screenshots/Step1-users-created.png)

---

## Step 2 — Conditional Access Policy Configuration

Configured a Conditional Access policy to require Multi-Factor Authentication for Azure management access.

### Policy Configuration

| Setting | Value |
|---|---|
| Policy Name | `MFA for Security Testers` |
| Target Group | `grp-security-testers` |
| Target Application | Microsoft Azure Management |
| Access Control | Require MFA |

### Validation

- MFA prompt triggered successfully
- Tested using incognito browser session

![CA Policy](./Screenshots/Step2-ca-policy-summary.png)

![MFA Prompt](./Screenshots/Step2-mfa-prompt.png)

---

## Risky Sign-In Detection

A simulated risky sign-in event was generated and detected successfully by Microsoft Entra ID Protection.

### Validation Performed

- Risky sign-in detected for `demo-user1`
- Conditional Access policy enforced MFA
- Event reviewed under:
  - `Entra ID Protection > Risky sign-ins`

![Risky Sign-In](./Screenshots/risky-signin-demo-user1.png)
---

## Step 3 — Privileged Identity Management (PIM)

Configured Privileged Identity Management for secure administrative role activation.

### Role Assignment

| User | Role | Assignment Type |
|---|---|---|
| `demo-user1` | Security Administrator | Eligible |

### Validation

- Role activated successfully through PIM
- Verified under:
  - `PIM > My Roles`

![Role Assignment](./Screenshots/Step4-role-assignment.png)

![PIM Activation](./Screenshots/Step4-pim-activation.png)

---

## Step 4 — Sign-In and Audit Log Review

Reviewed authentication activity and administrative actions using Microsoft Entra monitoring tools.

### Logs Reviewed

- Sign-In Logs
- Audit Logs
- MFA activity
- Role activation events

---

## Automation

The project includes a prototype PowerShell automation script:

```txt
automation/setup-identity-hardening.ps1
```

The script automates:

- Demo user creation
- Security group creation
- Conditional Access policy deployment

---

## Project Structure

```txt
entra-id-identity-hardening/
├── README.md
├── Screenshots/
├── docs/
├── automation/
└── scripts/
```

---

## Security Benefits Demonstrated

- Reduced administrative exposure using PIM
- Enforced MFA for privileged access
- Improved visibility into authentication activity
- Risk-based identity monitoring
- Controlled access through Conditional Access policies

---

## Future Improvements

Planned enhancements include:

- Identity Governance testing
- Access Reviews
- Entitlement Management
- Defender for Identity integration
- Microsoft Sentinel integration
- Simulated leaked credential scenarios

---

## Key Takeaways

- Conditional Access is critical for protecting cloud identities
- PIM reduces standing administrative privileges
- MFA significantly improves identity security posture
- Sign-in and audit logs provide valuable visibility into identity activity
- Identity protection should combine prevention, monitoring, and least privilege access

---

## Status

Completed — continuously expanding with additional identity security and monitoring scenarios.
