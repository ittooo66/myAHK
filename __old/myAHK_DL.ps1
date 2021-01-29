#ファイルダウンロード(ps1)
Invoke-WebRequest -Uri https://github.com/ittooo66/myAHK/archive/master.zip -OutFile .\master.zip

#ファイル解凍
Expand-Archive .\master.zip -Force