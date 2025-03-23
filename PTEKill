# Prompt for inputs
$serviceName = Read-Host "Enter the service name"
$expectedCurrentPath = Read-Host "Enter the current 'Path to Executable' (leave blank to skip check)"
$newPath = Read-Host "Enter the new full path to the executable"

# Get current service config
$serviceInfo = sc.exe qc "$serviceName" 2>&1

# Check if service exists
if ($serviceInfo -match "FAILED") {
    Write-Host "Service '$serviceName' not found."
    exit
}

# Extract current binary path from the output
$currentPath = ($serviceInfo | Where-Object { $_ -match "BINARY_PATH_NAME" }) -replace '.*:\s+', ''

# Show current path
Write-Host "`nCurrent Path to Executable:"
Write-Host $currentPath
Write-Host ""

# Optional: verify current path matches expected
if ($expectedCurrentPath -and ($currentPath -ne $expectedCurrentPath)) {
    Write-Host "Warning: The current path doesn't match what you expected."
    Write-Host "Expected: $expectedCurrentPasath"
    Write-Host "Found:    $currentPath"
    $continue = Read-Host "Do you want to continue anyway? (y/n)"
    if ($continue -ne 'y') {
        Write-Host "Aborted."
        exit
    }
}

# Format new path correctly
$quotedNewPath = '"' + $newPath + '"'

# Change binPath
Write-Host "Updating service..."
sc.exe config "$serviceName" binPath= $quotedNewPath

# Restart the service
try {
    Restart-Service -Name $serviceName -Force
    Write-Host "Service restarted successfully."
} catch {
    Write-Host "Could not restart the service. You may need to start it manually."
}
