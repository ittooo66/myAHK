param(
	[String]$in = "",
	[String]$out = "",
	[String]$from = "UTF-8",
	[String]$to = "SHIFT-JIS"
)

$enc_f = [Text.Encoding]::GetEncoding($from)
$enc_t = [Text.Encoding]::GetEncoding($to)
	Get-ChildItem $in -recurse |
		ForEach-Object {
			if($_.GetType().Name -eq "FileInfo"){
				$reader = New-Object IO.StreamReader($_.FullName, $enc_f)
				$o_path = $_.FullName.ToLower().Replace($in.ToLower(), $out)
				$o_folder = Split-Path $o_path -parent
				if(!(Test-Path $o_folder)){
					[Void][IO.Directory]::CreateDirectory($o_folder)
				}
				$writer = New-Object IO.StreamWriter($o_path, $false, $enc_t)
				while(!$reader.EndOfStream){$writer.WriteLine($reader.ReadLine())}
				$reader.Close()
				$writer.Close()
			}
		}
