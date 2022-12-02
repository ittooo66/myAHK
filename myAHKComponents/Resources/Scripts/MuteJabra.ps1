# Need https://github.com/frgnca/AudioDeviceCmdlets

#デバイス名を取得
$mic_active=Get-Content C:\Users\ittooo66\OneDrive\home\src\ahk\myAHKComponents\Resources\Variables\MIC_ACTIVE.txt -Raw

# マイクを有効化したいとき
if( $mic_active -eq "1" ){

# "Jabra"の"Recording"デバイスを探し、有効化する
for($i=1; $i -le (Get-AudioDevice -list).length ; $i++) {
  if ( ((Get-AudioDevice -Index $i).Type -eq 'Recording') -and (Get-AudioDevice -Index $i).Name.Contains("Jabra")){
    Set-AudioDevice -Index $i
    Set-AudioDevice -RecordingMute $true
    Set-AudioDevice -RecordingMute $false
    break
  }
}

}else{

# "Jabra"ではない"Recording"デバイスを探し、有効化する
for($i=1; $i -le (Get-AudioDevice -list).length ; $i++) {
  if ( ((Get-AudioDevice -Index $i).Type -eq 'Recording') -and (Get-AudioDevice -Index $i).Name.Contains("Jabra")){
    Set-AudioDevice -Index $i
    Set-AudioDevice -RecordingMute $false
    Set-AudioDevice -RecordingMute $true
    break
  }
}


# "Jabra"ではない"Recording"デバイスを探し、有効化する
# for($i=1; $i -le (Get-AudioDevice -list).length ; $i++) {
#   if ( ((Get-AudioDevice -Index $i).Type -eq 'Recording') -and !(Get-AudioDevice -Index $i).Name.Contains("Jabra")){
#     Set-AudioDevice -RecordingMute $false
#     Set-AudioDevice -RecordingMute $true
#     Set-AudioDevice -Index $i
#     break
#   }
# }

}