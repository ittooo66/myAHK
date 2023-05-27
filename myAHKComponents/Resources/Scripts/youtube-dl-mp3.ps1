$MyPath = Write-Output C:\Users\ittoo\OneDrive\home\src\linux\YoutubeServer\urls\_ManualDL\$((get-date).toString("yyyyMMddHHmmss"))
$MyFile = Get-Clipboard -Format Text
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($MyPath, $MyFile, $Utf8NoBomEncoding)
