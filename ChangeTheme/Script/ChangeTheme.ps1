Add-PSSnapin Microsoft.Xrm.Tooling.Connector
Set-ExecutionPolicy –ExecutionPolicy RemoteSigned –Scope CurrentUser
Import-Module Microsoft.Xrm.Data.Powershell

$Cred = Get-Credential -UserName <username> -Message "Please Enter admin credentials for CRM"
$conn = Get-CrmConnection -Credential $Cred -DeploymentRegion Oceania –OnlineType Office365 –OrganizationName <orgname>

$req = New-Object Microsoft.Crm.Sdk.Messages.PublishThemeRequest
$req.target = New-CrmEntityReference -EntityLogicalName "theme" -Id "<ThemeGuid>"
$result = [Microsoft.Crm.Sdk.Messages.PublishThemeResponse]$conn.ExecuteCrmOrganizationRequest($req, $null)

