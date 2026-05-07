<#
.SYNOPSIS
Automates core Entra ID identity hardening tasks for lab setup.

.DESCRIPTION
This script creates two demo users, one security group, and a Conditional Access policy requiring MFA.
It also shows how to connect to Microsoft Graph from PowerShell for further identity automation.
#>

param(
  [string]$TenantId,
  [string]$AdminUsername = 'azureadmin',
  [string]$AdminPassword = 'ReplaceWithASecurePassword!123'
)

function Ensure-GraphModule {
  if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
    Write-Host 'Installing Microsoft.Graph module...' -ForegroundColor Yellow
    Install-Module Microsoft.Graph -Scope CurrentUser -Force
  }
}

function Connect-Graph {
  Write-Host 'Connecting to Microsoft Graph...'
  Connect-MgGraph -Scopes 'User.ReadWrite.All','Group.ReadWrite.All','Policy.ReadWrite.ConditionalAccess','RoleManagement.ReadWrite.Directory' -TenantId $TenantId
}

function Create-DemoUser {
  param(
    [string]$UserPrincipalName,
    [string]$DisplayName
  )

  if (-not (Get-MgUser -UserId $UserPrincipalName -ErrorAction SilentlyContinue)) {
    Write-Host "Creating user: $UserPrincipalName"
    New-MgUser -AccountEnabled:$true -DisplayName $DisplayName -MailNickname $UserPrincipalName.Split('@')[0] -UserPrincipalName $UserPrincipalName -PasswordProfile @{ ForceChangePasswordNextSignIn = $true; Password = $AdminPassword }
  }
  else {
    Write-Host "User already exists: $UserPrincipalName"
  }
}

function Create-SecurityGroup {
  param(
    [string]$GroupName,
    [string]$Description
  )

  $group = Get-MgGroup -Filter "displayName eq '$GroupName'" -ErrorAction SilentlyContinue
  if (-not $group) {
    Write-Host "Creating group: $GroupName"
    $group = New-MgGroup -DisplayName $GroupName -MailEnabled:$false -MailNickname $GroupName -SecurityEnabled:$true -Description $Description
  }
  else {
    Write-Host "Group already exists: $GroupName"
  }

  return $group
}

function Add-MembersToGroup {
  param(
    [string]$GroupId,
    [string[]]$UserPrincipalNames
  )

  foreach ($userPrincipalName in $UserPrincipalNames) {
    $user = Get-MgUser -UserId $userPrincipalName
    if ($user) {
      try {
        Add-MgGroupMember -GroupId $GroupId -DirectoryObjectId $user.Id
        Write-Host "Added $userPrincipalName to group"
      }
      catch {
        Write-Host "Member already exists or could not add: $userPrincipalName"
      }
    }
  }
}

function Create-MfaPolicy {
  param(
    [string]$PolicyName,
    [string]$GroupId
  )

  $existing = Get-MgConditionalAccessPolicy -Filter "displayName eq '$PolicyName'" -ErrorAction SilentlyContinue
  if ($existing) {
    Write-Host "Conditional Access policy already exists: $PolicyName"
    return
  }

  $body = {
    displayName = $PolicyName
    state = 'enabled'
    conditions = @{
      users = @{ includeGroups = @($GroupId); includeGuestsOrExternalUsers = 'none' }
      applications = @{ includeApplications = @('All') }
    }
    grantControls = @{ operator = 'OR'; builtInControls = @('mfa') }
  }

  Write-Host "Creating Conditional Access policy: $PolicyName"
  Invoke-MgGraphRequest -Method POST -Uri '/identity/conditionalAccess/policies' -Body ($body | ConvertTo-Json -Depth 10)
}

Ensure-GraphModule
Connect-Graph

$users = @(
  @{ UserPrincipalName = 'demo-user1@yourtenant.onmicrosoft.com'; DisplayName = 'Demo User 1' },
  @{ UserPrincipalName = 'demo-user2@yourtenant.onmicrosoft.com'; DisplayName = 'Demo User 2' }
)

foreach ($user in $users) {
  Create-DemoUser -UserPrincipalName $user.UserPrincipalName -DisplayName $user.DisplayName
}

$group = Create-SecurityGroup -GroupName 'grp-security-testers' -Description 'Security testers for identity hardening lab'
Add-MembersToGroup -GroupId $group.Id -UserPrincipalNames $users.UserPrincipalName
Create-MfaPolicy -PolicyName 'MFA for Security Testers' -GroupId $group.Id

Write-Host 'Identity hardening lab setup complete. Review Entra ID portal for PIM role assignments and policy evaluation.' -ForegroundColor Green
