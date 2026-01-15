<# : batch script
@echo off
powershell -nop "if (-not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) { Start-Process -Verb RunAs 'cmd.exe' -ArgumentList '/c %~dpnx0 %*' } else { Invoke-Expression ([System.IO.File]::ReadAllText('%~f0')) }"
goto :eof
#>

# === Clear Only Windows Defender Protection History on reboot ===

$ClearAV = $true
$RemoveTask = $true

$Scans = 'C:\ProgramData\Microsoft\Windows Defender\Scans'
$Service = "$Scans\History\Service"
$TN = "ClearDefenderHistory"

# Build command line for the task
if ($ClearAV)    { $C1 = "rd /s /q `"$Service`" & " }
if ($RemoveTask) { $C2 = "schtasks /delete /f /tn $TN" }

# Create scheduled task that runs once at startup
$TD = "Delete Defender Protection History"
$TA = New-ScheduledTaskAction -Execute 'cmd.exe' -Argument "/c $C1$C2"
$TT = New-ScheduledTaskTrigger -AtStartup
$TP = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount
$TS = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -Force -Description $TD -Action $TA -Trigger $TT -Principal $TP -Settings $TS -TaskName $TN >$Null

Write-Host "`n✅ Defender protection history will be cleared on next reboot." -ForegroundColor Green

$choice = (Read-Host "`nRestart now to complete? (y/n)").ToLower()
if ($choice -eq "y") { Restart-Computer }
