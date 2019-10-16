# Add the script to the local scripts folder in the HOST Machine
Set-ExecutionPolicy -ExecutionPolicy Bypass
$server = "Server1"

$status = 2 #critical

if (Test-Connection -ComputerName $server -Count 3 -Quiet) {
$status = 0 #ok
$pingstatus = "is pinging"
}
else {
$status = 2
$pingstatus = "is not pining"
}

"$status Ping-Server1 ping=$status;;;; $server $pingstatus"
