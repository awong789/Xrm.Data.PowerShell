Add-PSSnapin Microsoft.Xrm.Tooling.Connector
Set-ExecutionPolicy –ExecutionPolicy RemoteSigned –Scope CurrentUser
Import-Module Microsoft.Xrm.Data.Powershell


## $Cred = Get-Credential -UserName SYDAICD\dev2016admin -Message "Please Enter admin credentials for CRM"
## $conn = Get-CrmConnection –ServerUrl https://greentealemon.crm6.dynamics.com -Credential $Cred -OrganizationName CDDEV

$Cred = Get-Credential -UserName awijaya@greentealemon.onmicrosoft.com -Message "Please Enter admin credentials for CRM"
$conn = Get-CrmConnection -Credential $Cred -DeploymentRegion Oceania –OnlineType Office365 –OrganizationName greentealemon

$req = New-Object Microsoft.Crm.Sdk.Messages.PublishThemeRequest
$req.target = New-CrmEntityReference -EntityLogicalName "theme" -Id "F80F5FDC-B083-E711-8127-E0071B795CA1"
$result = [Microsoft.Crm.Sdk.Messages.PublishThemeResponse]$conn.ExecuteCrmOrganizationRequest($req, $null)

