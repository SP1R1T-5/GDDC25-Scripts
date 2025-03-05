#Enter IPs of the Domain Controller(s) here :)
$IP1 = Read-Host "Enter DC Address" 
#$IP2 = "x.x.x.x"

#Enter Credentials and Domain Name
$Domain = Read-Host "Enter Domain (ie. domain.local)"
$User = "$Domain\Administrator"
$Pass = Read-Host "Enter Password" -AsSecureString

#Who wants 2 variables when you can have 1 
$Credential = New-Object System.Management.Automation.PSCredential ($User, $Pass)

#Setting the Preferred DNS of the Server
write-output "Pinging the DC . . . "
ping $IP1
Write-output "Setting the Prefered DNS Address"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $IP1

#Joining the Domain
Write-Output "Joining Domain!"
Add-Computer -DomainName $Domain -Credential $Credential 

Write-Output "Domain is all set!"
#Restart-Computer
Pause
#Jon Fortnite
