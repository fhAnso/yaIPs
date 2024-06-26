# Specify the network potion: .\yaIPs.ps1 192.168.111
# Use address of current machine: .\yaIPs.ps1

if ($args.Length -eq 0) 
{
    $local_ip = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.IPAddress -ne "127.0.0.1" }).IPAddress
    $network_portion = $local_ip.Substring(0, $local_ip.LastIndexOf('.'))

    Write-Output "No network portion given: using current address.."
    Write-Output "==> $network_portion.N"
} 
else 
{
    $network_portion = $args[0]
}

$output_file = "temp.txt"

Write-Output "Listing of reachable IPv4 addresses.."
Write-Output ("NOTE: The addresses will be saved to the following file: `"$output_file`"`n")

Remove-Item $output_file -ErrorAction SilentlyContinue

function Test-Host 
{
    param 
    (
        [string]$Address
    )

    $pingResult = Test-Connection -ComputerName $Address -Count 1 -Quiet

    if ($pingResult) 
    {
        Write-Output $Address
        $Address | Out-File -Append -FilePath $output_file
    }
}

for ($host_portion = 1; $host_portion -le 254; $host_portion++) 
{
    Test-Host -Address "$network_portion.$host_portion"
}

Write-Output "Done"
