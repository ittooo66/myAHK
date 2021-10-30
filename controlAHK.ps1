# AHK制御用スクリプト。monitorはタスクスケジューラで定期実行させる

# AHK保管先ディレクトリ(shell配置先と同様)
$AHK_DIR = $(Split-Path $MyInvocation.MyCommand.Path)
# フラグファイルのフルパス
$FLGFILE = $AHK_DIR + "\isActive.flg"

switch ($Args[0]) {
    # 起動時：フラグファイル作成
    "start" { New-Item $FLGFILE }
    # 停止時：フラグファイル削除
    "stop" { Remove-Item $FLGFILE }
    # 監視：フラグファイルとNGAP起動状態に応じて起動or停止
    "monitor" {

        # AHK起動状態の取得
        $AHKisActive = [int](tasklist | findstr AutoHotkey.exe | wsl wc -l)

        # 共存不可AP起動状態の取得
        $LolIsActive  = [int](tasklist | findstr "League\ of\ Legends.exe" | wsl wc -l)
        $VALOIsActive = [int](tasklist | findstr "VALORANT-Win64-Shipping" | wsl wc -l)
        $NGAPIsActive = $LolIsActive # + $VALOIsActive

        # FLGFILEがあり、NGAPが存在しない場合
        if((Test-Path $FLGFILE) -And (!$NGAPIsActive)){
            #AHKが起動されてなければ、起動
            if (!$AHKisActive){
                Set-Location  $AHK_DIR
                Start-Process .\Main.ahk
            }
        # 他条件下でAHKが起動している場合
        }elseif ($AHKisActive){
            get-process -name AutoHotkey | stop-process
            Start-Process -FilePath "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe" "-Command $($AHK_DIR + "\myAHKComponents\Resources\Scripts\mouseCursor_standard.ps1")" -WindowStyle Hidden
        }
    }
    # オプション間違ってる時の出力
    Default { Write-Output "BAD option. 'start|stop|monitor' are available. " }
}
