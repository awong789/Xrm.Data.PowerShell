Add-PSSnapin Microsoft.Xrm.Tooling.Connector
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Import-Module Microsoft.Xrm.Data.Powershell

$orgName = <organisation>
$DEVThemeguid = "<DEVThemeguid>"
$QAThemeguid = "<QAthemeguid>"
$UATThemeguid = "<UATThemeguid>"
$TrainingThemeguid = "<TrainingThemeguid>"


$Cred = Get-Credential -UserName <username> -Message "Please Enter admin credentials for CRM"
$conn = Get-CrmConnection -Credential $Cred -DeploymentRegion Oceania -OnlineType Office365 -OrganizationName $orgName 

$req = New-Object Microsoft.Crm.Sdk.Messages.PublishThemeRequest
If ($orgName -Like "*QA") {
  $req.target = New-CrmEntityReference -EntityLogicalName "theme" -Id $QAThemeguid
} ElseIf ($orgName -Like "*UAT") {
  $req.target = New-CrmEntityReference -EntityLogicalName "theme" -Id $UATThemeguid
} ElseIf ($orgName -Like "*DEV") {
  $req.target = New-CrmEntityReference -EntityLogicalName "theme" -Id $DEVThemeguid
} ElseIf ($orgName -Like "*Training") {
  $req.target = New-CrmEntityReference -EntityLogicalName "theme" -Id $TrainingThemeguid
}
$result = [Microsoft.Crm.Sdk.Messages.PublishThemeResponse]$conn.ExecuteCrmOrganizationRequest($req, $null)
