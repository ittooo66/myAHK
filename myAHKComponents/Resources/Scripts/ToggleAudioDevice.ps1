# Need https://github.com/frgnca/AudioDeviceCmdlets
$index1=1
$index2=2

if ( (Get-AudioDevice -Playback).index -eq $index1 ) {
    Set-AudioDevice -Index $index2
}else {
    Set-AudioDevice -Index $index1
}
