# Iván Weinberg's Powershell scripts

## Intro

Hello and welcome to this section about powershell scripting!

### What this is

Here you will find some scripts I've started writing to simplify some daily tasks I perform as a DevOps Engineer.

## To do and documentation

Below you' ll see some things I'd like to improve and/or add, along with  the corresponding documentation I' ve based some parts of this on.

### Aliases 

Set more aliases - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/set-alias?view=powershell-7.2

#### Examples:
Set-Alias -Name k120 -Value kubectl.exe
Read-Host - https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/read-host?view=powershell-7.2

$pwd_string = Read-Host "Enter a Password" -MaskInput

Get-Alias | Format-Table -Property Name, Options -Autosize

function - https://docs.microsoft.com/en-us/powershell/scripting/learn/ps101/09-functions?view=powershell-7.2
