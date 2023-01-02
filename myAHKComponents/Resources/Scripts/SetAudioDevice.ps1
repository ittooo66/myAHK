# Need https://github.com/frgnca/AudioDeviceCmdlets

#デバイス名を取得
$device_name=Get-Content C:\Users\ittooo66\OneDrive\home\src\ahk\Env\AUDIO_DEVICE.txt -Raw

#該当デバイス名を持つデバイスIDを取得し、ID指定でデバイス変更
for($i=1; $i -le 10; $i++) {
  if ( (Get-AudioDevice -Index $i | wsl grep $device_name | wsl wc -l ) -eq 1 ){
    Set-AudioDevice -Index $i
    break
  }
}
