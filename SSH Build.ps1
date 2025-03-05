#Installing SSH Package
echo"Downloading SSH..."
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0

#Starting SSH and enabling automatic startup
echo"Starting SSH"
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic

#Setting Firewall for SSH Connection
echo"Creating Firewall Rule"
netsh advfirewall firewall add rule name="SSHD" dir=in action=allow protocol=TCP localport=22

#Showing SSH Running
Get-Service sshd
netstat -an | Findstr 22

echo"SSH setup complete, don't break it again >:(" 
pause
#Jon Fortnite
