;コピー
HistoricalClip_copy(){
	;clipboardにCopy
	Send,^c
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
		;終了
		return
	}
	;ログ追記
	logger_clip(Clipboard)
}

;切り取り
HistoricalClip_cut(){
	;clipboardにCut
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;クリップボードに何も入ってこないとき
	if ErrorLevel <> 0
	{
		;終了
		return
	}
	;ログ追記
	logger_clip(Clipboard)
}

;ClipBoard履歴ログの表示
HistoricalClip_openLog(){
	run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\Log\clip.log
	sleep,500
	Send,^{End}
}
