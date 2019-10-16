# Add the script to the local scripts folder in the HOST Machine
Set-ExecutionPolicy -ExecutionPolicy Bypass
$server = "Server1"

$status = 2 #critical

if (Resolve-DnsName $server) {
$status = 0 #ok
$dnsname = (Resolve-DnsName $server | Select -ExpandProperty Name)
}
else {
$status = 2 #critical
$dnsname = "ERROR"
}

"$status ResolveDNS-Server1 dnsresolve=$status;;;; $server resolves to $dnsname"
