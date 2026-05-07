# Step-by-Step Identity Hardening Lab with Screenshots

A visual, hands-on walkthrough of Identity Hardening with Microsoft Entra ID. Screenshots are included to accompany each step.

---

## Step 1: Create Test Users and Security Group

1. Go to Microsoft Entra ID > Users > + New User
2. Create:
   - demo-user1 (standard user)
   - demo-user2 (standard user)
3. Assign temporary passwords and save them.
4. Navigate to Groups > + New Group
   - Group type: Security
   - Name: grp-security-testers
   - Add both test users as members.

**Screenshot:**  
![Users and Group Created](./Screenshots/Step1-users-created.png)

---

## Step 2: Conditional Access Policy – Require MFA

1. Go to: Microsoft Entra ID > Protection > Conditional Access
2. Click + New Policy
3. Name it: MFA for Security Testers
4. Configure the following:
   - Users/Groups: grp-security-testers
   - Cloud Apps: Microsoft Admin Portals
   - Access Controls: Grant ➞ Require MFA
   - Enable Policy: On
5. Save and enable the policy.
6. Open an Incognito Browser and sign in as demo-user1 to test the MFA requirement.

**Screenshots:**  
- Conditional Access Policy Summary:  
  ![CA Policy Summary](./Screenshots/Step2-ca-policy-summary.png)

- MFA Prompt (during test login):  
  ![MFA Prompt](./Screenshots/Step2-mfa-prompt.png)

---

### Risky Sign-In Triggered (Demo User1)

- A risky sign-in was triggered for `Demo User1` as part of the Conditional Access test.
- Microsoft Entra ID flagged the sign-in as high-risk based on behavior and location anomalies.
- The user was prompted for MFA and access was monitored.

 Screenshot:
![Risky Sign-In](Screenshots/risky-signin-demo-user1.png)

---
## Step 3: Role Assignment via PIM (Privileged Identity Management)

1. Go to: Microsoft Entra ID > Roles and Administrators
2. Search and select the role: Security Administrator
3. Click + Add Assignments
   - Select demo-user1
   - Assignment type: Eligible
4. Go to: Microsoft Entra ID > PIM > My Roles
5. Activate the role as demo-user1
   - Provide justification and choose activation time.

**Screenshots:**  
- Role Assignment Summary:  
  ![PIM Role Assignment](./Screenshots/Step4-role-assignment.png)

- PIM Activation Confirmation:  
  ![PIM Activation](./Screenshots/Step4-pim-activation.png)

---

## Wrap-Up

- Test users and roles were created and tested successfully.
- Conditional Access enforced MFA for selected users.
- Role-based access was controlled and elevated using PIM.

Refer to `Report.md` for written analysis and observations.

Remember to clean up the test users, group, and role assignments when finished.

