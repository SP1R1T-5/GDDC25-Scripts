#Installing SSH Package
write-output "Downloading SSH..."
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

#Starting SSH and enabling automatic startup
write-output "Starting SSH"
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

#Setting Firewall for SSH Connection
write-output "Creating Firewall Rule"
netsh advfirewall firewall add rule name="SSHD" dir=in action=allow protocol=TCP localport=22

#Showing SSH Running
Get-Service sshd

write-output "SSH setup complete, don't break it again >:(" 
pause
#Jon Fortnite
