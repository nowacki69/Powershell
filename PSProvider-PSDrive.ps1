Get-PSProvider
Get-PSDrive

Get-ChildItem -Path c:\

Get-ChildItem -Path HKCU:\Console

Import-Module Microsoft.PowerShell.Security

Get-ChildItem -Path cert:\


New-PSDrive -Name WINDIR -Root C:\windows -PSProvider FileSystem
Get-ChildItem windor:
Remove-PSDrive -Name WINDIR

Get-Command -Noun Item, ChildItem
Get-Command -Noun ItemProperty


Get-ChildItem hkcu:
New-Item -Path HKCU:\Software -Name Clasroom
Get-ChildItem hkcu:\soft*\c*
New-ItemProperty -Path HKCU:\Software\Clasroom -Name Test -Value 1
Remove-Item HKCU:\Software\Clasroom
