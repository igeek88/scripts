Write-Output "If this appears, ($USERPROFILE)\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 was loaded successfully.

Removing old version of $env:userprofile\Documents\PowerShell\aliases.ps1"
Remove-Item "$env:userprofile\Documents\PowerShell\aliases.ps1"

Write-Output "Copying new aliases.ps1 script to $env:userprofile\Documents\PowerShell\ and executing it." 
Copy-Item -Path "$env:userprofile\git\mine\scripts\Powershell\aliases.ps1" -Destination "$env:userprofile\Documents\PowerShell\"
Set-Location "$env:userprofile\Documents\PowerShell\"
.\aliases.ps1

<# Write-Output "Setting variables to perform login
adoSubId
adoRGName
adoAKSName"

$adoSubId=Read-Host "Enter subscriptionId" -MaskInput
$adoRGName=Read-Host "Enter Resource Group Name" -MaskInput
$adoAKSName=Read-Host "Enter AKS Cluster Name" -MaskInput

Write-Output 'Performing login to Azure'
az login --use-device-code

Write-Output 'Setting account: Remember to change default set variables if needed'
az account set --subscription $adoSubId
az aks get-credentials --resource-group $adoRGName --name $adoAKSName

Commands to be run manually, if needed:
$rg="" #desired env name
$aks="" #desired aks env cluster name 
$sub="" #desired env subscrition ID
az login && az account set --subscription $env:sub
az aks get-credentials --resource-group $env:rg --name $env:aks

$adoSubId=Read-Host "Enter subscriptionId" -MaskInput #>
