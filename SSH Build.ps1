Add-WindowsFeature -Name OpenSSH-Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

netsh advfirewall name="SSHD" dir=in protocol=TCP action=allow 

Get-Service sshd
netstat -an | Findstr 22

#Jon Fortnite
