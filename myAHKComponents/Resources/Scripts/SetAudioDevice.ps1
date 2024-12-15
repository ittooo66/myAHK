# Need https://github.com/frgnca/AudioDeviceCmdlets

#デバイス名を取得
$device_name=Get-Content D:\SRC\ahk\Env\AUDIO_DEVICE.txt -Raw

#該当デバイス名を持つデバイスIDを取得し、ID指定でデバイス変更
for($i=1; $i -le 10; $i++) {
  if ((Get-AudioDevice -Index $i).Name -like "*$device_name*" ){
    Set-AudioDevice -Index $i
    break
  }
}
