;キーロガー
;A_WorkingDir/keylog.txtに1秒おきに書き込み入ってく
;用途：さらなる入力効率化？
;

#Persistent                         ;ホットキーなどを使用しない場合で、スクリプトを常駐させたいときに
Cache := ""
SetTimer,OnTimer,60000              ;60秒ごとのOnTimer起動
Return                              ;スクリプト起動時に実行される部分の終了

~LShift::write("LShift")
~RShift::write("RShift")
~RControl::write("RControl")
~LControl::write("LControl")
~Return::write("Return")
~Space::write("Space")
~RAlt::write("RAlt")
~LAlt::write("LAlt")
~Tab::write("Tab")
~LButton::write("LButton")
~RButton::write("RButton")
~XButton1::write("XButton1")
~XButton2::write("XButton2")
~WheelUp::write("WheelUp")
~WheelDown::write("WheelDown")

~ESC::write("ESC")
~a::write("a")
~b::write("b")
~c::write("c")
~d::write("d")
~e::write("e")
~q::write("q")
~w::write("w")
~r::write("r")

write(log){
    global Cache
    time = %A_Now%
    Cache = %Cache%Time:%time%,%log%`n
}


;Reload AHK
Ralt & ,::Reload
;Suspend AHK
Ralt & .::Suspend

OnTimer:                            ;タイマーに割り当てられるサブルーチンラベル
  FileAppend,
  (
    %Cache%
  ), %A_WorkingDir%\keylog.txt
  Cache :=""
return
