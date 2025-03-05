Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

netsh advfirewall firewall add rule name="SSHD" dir=in action=allow protocol=TCP localport=22

Get-Service sshd
netstat -an | Findstr 22

#Jon Fortnite
