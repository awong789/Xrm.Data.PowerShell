# Xrm.Data.PowerShell
This module demonstrate on how to automatically setup different theme for your Dynamics365 environment using Powershell module by  Microsoft.Xrm.Data.Powershell. Handy if you are administering multiple Dynamics365 environment.

# Pre Requisite
## Step 1: Install Powershell for CRM Connector
1.	Update to powershell 4 (https://www.microsoft.com/en-au/download/details.aspx?id=40855) and then install.
2.	Download Dynamics 365 SDK (https://www.microsoft.com/en-us/download/details.aspx?id=50032 ). 
3.	Run the package file to extract the contents of the package. The PowerShell assembly (Microsoft.Xrm.Tooling.CrmConnector.Powershell.dll) and the script (RegisterXRMTooling.ps1) for registering the cmdlets are located in the \SDK\bin folder in the SDK.
4.	Start Windows PowerShell on your computer with elevated privileges (run as administrator).
5.	At the prompt, change your directory to the folder that contains the PowerShelldll file and the script for registering the cmdlets. For example:
```
cd c:\SDK\bin
```

6.	Run the RegisterXRMTooling.ps1 script to register the XRM tooling PowerShell assembly, and install the Windows PowerShell snap-in. Type the following command, and press ENTER:
```
.\RegisterXRMTooling.ps1
```
7.	Add the Windows PowerShell snap-in. This registers the Get-CrmConnection and Get-CrmOrganizations cmdlets.
```
Add-PSSnapin Microsoft.Xrm.Tooling.Connector
```

8.	You’re now ready to use these Windows PowerShell cmdlets. To list the cmdlets that you registered, run the following command in the Windows PowerShell window:
```
Get-Help “Crm”
```

## Setup 2: Install XRM Data Powershell
1.	Go to Releases (https://github.com/seanmcne/Microsoft.Xrm.Data.PowerShell/releases) and Download Microsoft.Xrm.Data.Powershell.zip.
2.	Right click the downloaded zip file and click "Properties".
3.	Check "Unblock" checkbox and click "OK", or simply click "Unblock" button depending on OS versions.       
4.	Extract the zip file and copy "Microsoft.Xrm.Data.PowerShell" folder to one of the following folders:
+	%USERPROFILE%\Documents\WindowsPowerShell\Modules
+	%WINDIR%\System32\WindowsPowerShell\v1.0\Modules Following image shows this module copied to User Profile. If you want anyone to use the module on the computer, copy them to System Wide PowerShell module folder instead. If you do not have the folder, you can manually create them.
 
5.	As this module is not signed, you may need to change Execution Policy to load the module. You can do so by executing following command.
```
 Set-ExecutionPolicy –ExecutionPolicy RemoteSigned –Scope CurrentUser
```
6.	Open PowerShell and run following command to load the module.
```
Import-Module Microsoft.Xrm.Data.Powershell
```



# To Change theme automatically using the script:
1. Copy all the ChangeTheme folders
2. Upload all the 3 files under /Resources in solutions in your Dynamics instance
3. Import the Theme on /Data/CRMTheme_10Colors.csv to Dynamics
4. Open the Script /Script/ChangeTheme.ps1. Change the following variable accordingly

| Variable | Description | 
|----------|:------------|
| username | your CRM online username |
| orgname  | your CRM Organisation Name |
| ThemeGuid | pick the theme you want to automatically switch into |

 5. Run the script on powershell
