# Xrm.Data.PowerShell
Usage of Microsoft Xrm.Data.Powershell

To Change theme automatically using the script:
1. Copy all the ChangeTheme folders
2. Upload all the 3 files under Resources in solutions in your Dynamics instance
3. Import the Theme on /Data/CRMTheme_10Colors.xlsx to Dynamics
4. Open the Script /Script/ChangeTheme.ps1. Change the following variable accordingly
 <username> your CRM online username
 <orgname> your CRM Organisation Name
 <ThemeGuid> pick the theme you want to automatically switch into
 5. Run the script on powershell
