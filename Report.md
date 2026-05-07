# Identity Hardening Security Report

![Identity](https://img.shields.io/badge/Identity-Microsoft%20Entra%20ID-5E5ADB)
![Security](https://img.shields.io/badge/Security-Conditional%20Access-008272)
![PIM](https://img.shields.io/badge/Access-PIM-7C3AED)
![MFA](https://img.shields.io/badge/Auth-Multi--Factor%20Authentication-0078D4)
![Protection](https://img.shields.io/badge/Protection-Identity%20Protection-DC2626)
![Monitoring](https://img.shields.io/badge/Monitoring-Sign--In%20Logs-2563EB)

---

## Overview

This report documents the identity security controls implemented using Microsoft Entra ID to strengthen authentication security, reduce standing privileges, and improve visibility into identity-related activity.

The project focused on Conditional Access, Multi-Factor Authentication (MFA), Privileged Identity Management (PIM), and risky sign-in monitoring.

---

## Identity Security Controls Implemented

### User and Group Provisioning

Created dedicated test users and a security group for policy targeting and access testing.

| Type | Name |
|---|---|
| User | `demo-user1` |
| User | `demo-user2` |
| Group | `grp-security-testers` |

### Security Improvements

- Centralized policy targeting using security groups
- Isolated test identities for validation scenarios
- Group-based Conditional Access enforcement

---

## Conditional Access Policy

Configured a Conditional Access policy to require Multi-Factor Authentication for Azure management access.

### Policy Details

| Setting | Value |
|---|---|
| Policy Name | `MFA for Security Testers` |
| Target Group | `grp-security-testers` |
| Target Application | Microsoft Azure Management |
| Access Requirement | Require MFA |

### Validation

- MFA registration triggered successfully
- MFA challenge verified during sign-in
- Policy applied successfully to targeted users

---

## Privileged Identity Management (PIM)

Configured Privileged Identity Management to reduce standing administrative access.

### Role Assignment

| User | Role | Assignment Type |
|---|---|---|
| `demo-user1` | Security Administrator | Eligible |

### PIM Controls Applied

- Just-in-time role activation
- Eligible role assignment
- Reduced permanent privileged access
- Administrative activity visibility

---

## Risky Sign-In Detection

A simulated risky sign-in event was detected successfully during testing.

### Detection Summary

| User | Detection | Result |
|---|---|---|
| `demo-user1` | Risky Sign-In | MFA enforced |

### Validation Performed

- Risk event detected under:
  - `Entra ID Protection > Risky sign-ins`
- Sign-in classified as risky based on behavioral analytics
- Conditional Access policy enforced MFA during authentication
- Risk successfully mitigated through MFA challenge

![Risky Sign-In](./Screenshots/risky-signin-demo-user1.png)

---

## Monitoring and Audit Review

Reviewed Microsoft Entra monitoring tools to validate authentication activity and administrative operations.

### Logs Reviewed

- Sign-In Logs
- Audit Logs
- MFA activity
- PIM activation events
- Identity protection alerts

### Observations

- Successful MFA enforcement recorded
- PIM role activations logged correctly
- Risky sign-in event visible in Identity Protection

---

## Security Recommendations Observed

### MFA Registration

Microsoft Entra ID initially identified users without MFA registration.

After Conditional Access enforcement:
- Users were prompted to register MFA
- Authentication security posture improved

### Privileged Access Recommendations

Microsoft recommends using PIM for privileged roles to:
- Minimize standing administrative privileges
- Improve administrative accountability
- Reduce exposure to privilege misuse

This recommendation was implemented successfully during the project.

---

## Summary

| Control | Status |
|---|---|
| Users and Groups | Configured |
| Conditional Access | MFA Enforced |
| PIM Role Assignment | Implemented |
| MFA Validation | Successful |
| Audit and Sign-In Logs | Reviewed |
| Risky Sign-In Detection | Triggered |

---

## Key Takeaways

- Conditional Access strengthens identity protection significantly
- MFA is critical for securing privileged access
- PIM helps reduce standing administrative privileges
- Risk-based sign-in monitoring improves visibility into suspicious activity
- Identity monitoring should combine prevention, detection, and least privilege access

---

## Future Improvements

Planned enhancements include:

- Simulated sign-ins from unfamiliar locations
- TOR/VPN-based sign-in testing
- Microsoft Defender for Identity integration
- Identity Governance testing
- Access Reviews
- Entitlement Management
- Microsoft Sentinel integration

---

## Status

Completed — continuously expanding with additional identity protection and monitoring scenarios.
