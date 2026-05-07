# Microsoft Entra ID Identity Hardening — Implementation Guide

![Identity](https://img.shields.io/badge/Identity-Microsoft%20Entra%20ID-5E5ADB)
![Security](https://img.shields.io/badge/Security-Conditional%20Access-008272)
![PIM](https://img.shields.io/badge/Access-PIM-7C3AED)
![MFA](https://img.shields.io/badge/Auth-Multi--Factor%20Authentication-0078D4)
![Protection](https://img.shields.io/badge/Protection-Identity%20Protection-DC2626)
![Monitoring](https://img.shields.io/badge/Monitoring-Sign--In%20Logs-2563EB)

---

## Overview

This guide documents the implementation of identity hardening controls using Microsoft Entra ID.

The project focuses on securing administrative access through Conditional Access, Multi-Factor Authentication (MFA), Privileged Identity Management (PIM), and identity monitoring.

Screenshots are included throughout the guide to validate configuration and testing steps.

---

## Environment Components

| Component | Purpose |
|---|---|
| Microsoft Entra ID | Identity and access management |
| Conditional Access | MFA enforcement |
| PIM | Just-in-time privileged access |
| Sign-In Logs | Authentication monitoring |
| Audit Logs | Administrative activity monitoring |

---

## Step 1 — Create Test Users and Security Group

Created test users and a dedicated security group for Conditional Access policy targeting.

### Users Created

| User | Type |
|---|---|
| `demo-user1` | Standard User |
| `demo-user2` | Standard User |

### Security Group

| Group | Purpose |
|---|---|
| `grp-security-testers` | Conditional Access targeting |

### Actions Performed

- Created test users
- Assigned temporary passwords
- Created security group
- Added users to security group

![Users and Group Created](./Screenshots/Step1-users-created.png)

---

## Step 2 — Configure Conditional Access Policy

Configured a Conditional Access policy to require MFA for Azure administrative access.

### Policy Configuration

| Setting | Value |
|---|---|
| Policy Name | `MFA for Security Testers` |
| Target Group | `grp-security-testers` |
| Cloud Apps | Microsoft Admin Portals |
| Access Control | Require MFA |
| Policy State | Enabled |

### Validation

- MFA challenge triggered successfully
- Tested using incognito browser session
- Policy applied correctly to targeted users

### Screenshots

#### Conditional Access Policy Summary

![CA Policy Summary](./Screenshots/Step2-ca-policy-summary.png)

#### MFA Prompt During Sign-In

![MFA Prompt](./Screenshots/Step2-mfa-prompt.png)

---

## Risky Sign-In Detection

A simulated risky sign-in event was triggered and detected successfully by Microsoft Entra ID Protection.

### Detection Details

- Risky sign-in triggered for:
  - `demo-user1`
- Sign-in flagged as high-risk
- Conditional Access enforced MFA automatically
- Event reviewed under:
  - `Entra ID Protection > Risky sign-ins`

### Validation Outcome

- Risk event detected successfully
- MFA challenge enforced
- Authentication activity logged in Entra ID

![Risky Sign-In](./Screenshots/risky-signin-demo-user1.png)

---

## Step 3 — Privileged Identity Management (PIM)

Configured Privileged Identity Management to reduce standing administrative privileges.

### Role Assignment

| User | Role | Assignment Type |
|---|---|---|
| `demo-user1` | Security Administrator | Eligible |

### Actions Performed

- Assigned Security Administrator role
- Configured eligible assignment
- Activated role through PIM
- Provided activation justification

### Screenshots

#### PIM Role Assignment

![PIM Role Assignment](./Screenshots/Step4-role-assignment.png)

#### PIM Activation

![PIM Activation](./Screenshots/Step4-pim-activation.png)

---

## Step 4 — Sign-In and Audit Log Review

Reviewed authentication and administrative activity using Microsoft Entra monitoring tools.

### Logs Reviewed

- Sign-In Logs
- Audit Logs
- MFA activity
- PIM activation events
- Risk detections

### Validation

- Successful MFA attempts confirmed
- PIM activations logged correctly
- Administrative actions recorded successfully

---

## Security Benefits Demonstrated

- MFA enforcement for privileged access
- Reduced standing administrative privileges
- Improved visibility into identity activity
- Risk-based authentication monitoring
- Centralized identity protection controls

---

## Key Takeaways

- Conditional Access is essential for protecting cloud identities
- PIM reduces administrative exposure significantly
- MFA improves resistance against credential compromise
- Identity monitoring provides visibility into suspicious activity
- Security groups simplify policy targeting and administration

---

## Cleanup Recommendations

After testing:

- Remove demo users
- Delete test security groups
- Remove unused role assignments
- Disable unused Conditional Access policies

---

## Status

Implementation completed successfully with MFA enforcement, PIM activation, and risky sign-in monitoring validated.
