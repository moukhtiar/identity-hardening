# Identity Hardening Automation

This folder contains a PowerShell automation script to create Entra ID test users, a security group, and a Conditional Access policy.

## Files

- `setup-identity-hardening.ps1` - Creates demo users and group, then applies an MFA Conditional Access policy.

## Usage

1. Open PowerShell.
2. Update the tenant-specific values in the script or pass them as parameters.
3. Run:
   ```powershell
   .\setup-identity-hardening.ps1 -TenantId '<your-tenant-id>'
   ```

## Notes

- `Microsoft.Graph` PowerShell module is required.
- This script is a lab automation skeleton and may need customization for your tenant, licensing, and security requirements.
