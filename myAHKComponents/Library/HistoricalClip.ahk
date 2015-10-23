index := 1

;履歴ペースト
HistoricalClip_openWindow(){
  global index
  if(index<1){
    index:=1
  }else if(index>10){
    index:=10
  }

  ;GUI初期化
	GUI, Destroy
	;常に最前面に表示
	Gui +AlwaysOnTop
	;GUI背景色の変更
	Gui, Color, 0x404040

	;表示
  Loop, 10
  {
    if(index = A_Index){
      Gui, Font, s13 cRed
    }Else
      Gui, Font, s13 cWhite
    FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%A_Index%.txt
    Gui, Add, Text, , %file%
  }
  Gui, Add, Text, , %index%

	;Window周りの設定
	Gui +LastFound
	Opacity=210
	Winset, Transparent, %Opacity%
	Gui, -Caption

	Gui, Show
}

HistoricalClip_up(){
  global index
  index--
  HistoricalClip_openWindow()
}

HistoricalClip_down(){
  global index
  index++
  HistoricalClip_openWindow()
}

HistoricalClip_return(){
  global index
  Gui, show, Hide
  cb_bk = %ClipboardAll%
  FileRead, Clipboard , %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%index%.txt
  sleep,100
  Send,^v
  Clipboard = %cb_bk%
}

HistoricalClip_stackCopy(){
  ;cb_bkに中身を退避
  cb_bk = %ClipboardAll%
  ;一旦clipboardを空にする
  clipboard =
  ;clipboardにCopy
  Send,^c
  ;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
  ClipWait 0.5, 1
  ;クリップボードに何も入ってこないとき
  If ErrorLevel <> 0
  {
    ;終了
    Return
  }
  ;履歴更新
  Loop, 10
  {
    i := 11 - A_Index
    j := i-1
    FileDelete,  %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.txt
    FileMoveDir, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%j%.txt, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%i%.txt, R
  }
  ;最新履歴をClipboardから取得
  FileAppend, %Clipboard%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.txt
}
