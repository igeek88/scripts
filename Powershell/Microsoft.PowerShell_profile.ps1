Write-Output "If this appears, $env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1 was loaded successfully."

<# Removing old version of $env:userprofile\Documents\PowerShell\aliases.ps1"
Remove-Item "$env:userprofile\Documents\PowerShell\aliases.ps1"

Write-Output "Copying new aliases.ps1 script to $env:userprofile\Documents\PowerShell\ and executing it." 
Set-Location "$env:userprofile\Documents\PowerShell\"
Copy-Item -Path "$env:userprofile\git\mine\scripts\Powershell\aliases.ps1" -Destination "$env:userprofile\Documents\PowerShell\"
.\aliases.ps1 #>

Write-Output 'Setting aliases, functions and variables.'

# Initialising variables
$dn="deafault-namespace" # Default namespace
$n="" # Desired namespace
$sl="" # Set with desired service to read logs from

# Aliases
Set-Alias -Name k -Value kubectl_1.22.0.exe
Set-Alias -Name k1 -Value kubectl.exe
Set-Alias -Name k0 -Value kubectl_1.20.0.exe

# Kubernetes Get Functions
function kGetService () {
    [alias ("kgs")]
    param(
        [string] $s,
        [string] $n
    )
    Write-Output "Getting service $s on $n namespace." ; k get svc $s -n $n
}
function kGetMatchingService () {
    [alias ("kgms")]
    param(
        [string] $s,
        [string] $n
    )
    Write-Output "Getting service(s) matching $s on $n namespace." ; k get svc -n $n | select-string $s
}
function kGetPods () {
    [alias ("kgp")]
    param(
        [string] $p,
        [string] $n
    )
    Write-Output "Getting pod '$p' on $n namespace." ; k get pods $p -n $n
}
function kGetMatchingPods () {
    [alias ("kgmp")]
    param(
        [string] $p,
        [string] $n
    )
    Write-Output "Getting pod(s) matching '$p' on $n namespace." ; k get pods -n $n | select-string $p
}
function kGetDeployments () {
    [alias ("kgd")]
    param(
        [string] $d,
        [string] $n
    )
    Write-Output "Getting deployment '$d' on $n namespace." ; k get deployments $d -n $n
}
function kGetMatchingDeployments () {
    [alias ("kgmd")]
    param(
        [string] $d,
        [string] $n
    )
    Write-Output "Getting deployment(s) matching '$d' on $n namespace." ; k get deployments -n $n | select-string $d
}

# Kubernetes Describe Functions
function kDescribeService () {
    [alias ("kds")]
    param(
        [string] $s,
        [string] $n
    )
    Write-Output "Describing service $s on $n namespace." ; k describe svc $s -n $n
}
function kDescribeMatchingService () {
    [alias ("kdms")]
    param(
        [string] $s,
        [string] $n
    )
    Write-Output "Describing service(s) matching $s on $n namespace." ; k describe svc -n $n | select-string $s
}
function kDescribePods () {
    [alias ("kdp")]
    param(
        [string] $p,
        [string] $n
    )
    Write-Output "Describing pod '$p' on $n namespace." ; k describe pods $p -n $n
}
function kDescribeMatchingPods () {
    [alias ("kdmp")]
    param(
        [string] $p,
        [string] $n
    )
    Write-Output "Describing pod(s) matching '$p' on $n namespace." ; k describe pods -n $n | select-string $p
}
function kDescribeDeployments () {
    [alias ("kdd")]
    param(
        [string] $d,
        [string] $n
    )
    Write-Output "Describing deployment '$d' on $n namespace." ; k describe deployments $d -n $n
}
function kDescribeMatchingDeployments () {
    [alias ("kdmd")]
    param(
        [string] $d,
        [string] $n
    )
    Write-Output "Describing deployment(s) matching '$d' on $n namespace." ; k describe deployments -n $n | select-string $d
}

<#
Set-Alias -Name k  -Value $s -n $n 
Set-Alias -Name k  -Value $s -n $n #>

$env:KUBE_EDITOR="code -w"


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
az aks get-credentials --resource-group $adoRGName --name $adoAKSName<#

<#
Commands to be run manually, if needed:
$rg="" #desired env name
$aks="" #desired aks env cluster name 
$sub="" #desired env subscrition ID (i.e. )
az login && az account set --subscription $env:sub
az aks get-credentials --resource-group $env:rg --name $env:aks

$adoSubId=Read-Host "Enter subscriptionId" -MaskInput#>