# Add the script to the local scripts folder in the HOST Machine

Set-ExecutionPolicy -ExecutionPolicy Bypass
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
try{
$request = $null
$request = Invoke-WebRequest -Uri "https://SomeURL.com" -UseBasicParsing -UseDefaultCredential
} 
catch
{              
$request = $_.Exception.Response            
}  
$StatusCode = [int] $request.StatusCode;
$StatusDescription = $request.StatusDescription;


$status = 2 #critical

if ($StatusCode -like 200) {
$status = 0 #ok
}

"$status HTTPResponseCode-SomeURL http_responsecode=$StatusCode;;;; HTTP response code $StatusCode"
