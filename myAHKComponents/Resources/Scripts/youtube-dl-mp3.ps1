$MyPath = Write-Output D:\SRC\linux\RHEL9-Youtube\urls\_ManualDL\$((get-date).toString("yyyyMMddHHmmss"))
$MyFile = Get-Clipboard -Format Text
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllText($MyPath, $MyFile, $Utf8NoBomEncoding)
