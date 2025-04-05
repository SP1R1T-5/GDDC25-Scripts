#Made to stop all Windows services for GDDC25

# List of target service names
$servicesToStop = @(
    'DNS',       # DNS Server
    'NTDS',      # Active Directory Domain Services
    'W3SVC',     # World Wide Web Publishing Service
    'CertSvc'    # Active Directory Certificate Services
)

# Function to attempt stopping each service
foreach ($svcName in $servicesToStop) {
    try {
        $svc = Get-Service -Name $svcName -ErrorAction Stop
        if ($svc.Status -ne 'Stopped') {
            Write-Host "Stopping service: $svcName ($($svc.DisplayName))"
            Stop-Service -Name $svcName -Force -ErrorAction Stop
            Write-Host "Successfully stopped $svcName`n"
        }
        else {
            Write-Host "$svcName is already stopped.`n"
        }
    }
    catch {
        Write-Warning "Failed to stop service '$svcName': $_"
    }
}


#Jon Fortnite
