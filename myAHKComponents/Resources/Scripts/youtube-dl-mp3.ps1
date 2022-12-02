$MyPath = Write-Output C:\Users\ittooo66\OneDrive\home\src\linux\YoutubeServer\urls\MusicDL\$((get-date).toString("yyyyMMddHHmmss"))
$MyFile = Get-Clipboard -Format Text
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines($MyPath, $MyFile, $Utf8NoBomEncoding)
