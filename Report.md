# Report – 2: Identity Hardening with Microsoft Entra ID

## 1. What Identity Security Controls Were Implemented?

During this lab, the following identity-focused controls were implemented to enhance access security and privilege management within the Azure environment:

### User and Group Provisioning

- Created two standard test users: `demo-user1` and `demo-user2`.
- Created a dedicated security group named `grp-security-testers` to manage access policies collectively.

### Conditional Access Policy

- Enforced Multi-Factor Authentication (MFA) for all users in `grp-security-testers`.
- Targeted access to the Microsoft Azure Management portal, ensuring that sensitive resources require strong authentication.

### Privileged Identity Management (PIM)

- Assigned the Security Administrator role to `demo-user1` using an eligible role assignment.
- Required just-in-time role activation with justification and optional approval, minimizing standing privileges.

---

## 2. What Did Microsoft Entra ID Recommend or Detect?

### MFA Enforcement

- Entra ID initially flagged users as not registered for MFA.
- Once Conditional Access was enforced, users were prompted to complete MFA registration during login.

### PIM Recommendation

- Microsoft recommends using Privileged Identity Management (PIM) for all privileged roles.
- This best practice was implemented with eligible assignments and on-demand role activation.

### Risky Sign-In Detection (Demo User1)

- During testing, a risky sign-in was detected for `demo-user1`.
- The event was logged under Microsoft Entra ID Protection > Risky sign-ins.
- The sign-in was classified as high-risk due to behavior-based analytics.
- Conditional Access enforced MFA as a response, successfully mitigating the risk.
- Screenshot: `Screenshots/risky-signin-demo-user1.png`

---

## Summary

| Control Implemented        | Status         |
|----------------------------|----------------|
| Users and Groups           | Configured     |
| Conditional Access         | Enforced MFA   |
| PIM Role Assignment        | Activated      |
| Audit and Sign-in Logs     | Reviewed       |
| Risky Sign-In Detection    | Triggered      |

---

## Next Steps

- Continue simulating risky sign-ins using VPN, TOR, or unfamiliar sign-in locations to test detection depth.
- Explore Microsoft Defender for Identity for more advanced threat detection based on on-prem signals.
- Implement Access Reviews and Entitlement Management under Microsoft Entra ID Governance for periodic evaluation of user access.
