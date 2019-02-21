1,2,3 | ForEach-Object -Process {$PSItem + 3}
1,2,3 | % {$_ + 3}
Get-EventLog -List
Get-EventLog -List | Get-Member
Get-EventLog -List | where log -eq "windows powershell" | % clear
Get-Command *eventlog
Clear-EventLog -log "windows powershell"

Get-Date
Get-Date | Get-Member
Get-Date | Select-Object -Property DayOfYear

Get-Command *hotfix
Get-HotFix | Get-Member

Get-HotFix | Select-Object -Property HotFixID, InstalledOn, InstalledBy

get-command *rule
help Get-NetFirewallRule
Get-NetFirewallRule | Get-Member
Get-NetFirewallRule -Enabled TRUE | Select-Object -Property InstanceID, Profile, Direction, Action | Sort-Object -Property InstanceID

get-command *neighbor
get-help Get-NetNeighbor -examples
Get-NetNeighbor | Select-Object -Property IPAddress, State | Sort-Object -Property State

Get-Process | Get-Member
Get-Process | Sort Name -Descending | ConvertTo-Html Name,ID,VM,PM | Out-File c:\processes.html
help ConvertTo-Html -Examples

Get-EventLog -Newest 10 -LogName System | Export-Csv c:\SysEvents.csv -NoTypeInformation
help export-csv

get-command *service
Get-Service | Get-Member
Get-Service | Select Name, DisplayName,Status | Sort Status -Descending | Export-Clixml c:\Services.xml

help ConvertTo-Csv
Get-EventLog -Newest 20 -LogName Security | Select EventID, TimeWritten, Message 
get-eventlog -newest 20 -LogName Security | Select EventID, TimeWritten, Message | Export-Csv c:\Security.pdd -Delimiter '|'
Import-Csv C:\Security.pdd -Delimiter "|" | Select -First 10