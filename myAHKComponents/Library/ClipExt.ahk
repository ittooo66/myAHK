;Clipboard関連の追加機能

;コピー
ClipExt_copy(){
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
ClipExt_cut(){
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

;拡張クリップボード(copy)
ClipExt_copyTo(num){
	;Spaceキーのスタックを消費
	consumeSpace()
	;cb_bkに中身を退避
	cb_bk = %ClipboardAll%
	;一旦clipboardを空にする
	clipboard =
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
	;ファイルにClipboardを保存
	FileAppend, %ClipboardAll%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
	;cb_bkから取得
	Clipboard = %cb_bk%
}

;拡張クリップボード(paste)
ClipExt_pasteFrom(num){
	;Spaceキーのスタックを消費
	consumeSpace()
	;content取得
	FileRead, content ,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
	;content出力
	directInput(content)
}

;ショートカット生成
ClipExt_addAlias(num){
	;Explorer画面以外で暴発しないように
	WinGetClass, class, A
	if(class != "CabinetWClass"){
		return
	}
	;Clipboard退避
	cb_bk = %ClipboardAll%
	;clipboardにコピー
	clipboard =
	Send, ^c
	ClipWait 1
	;ディレクトリ位置の再構成
	filename = %clipboard%
	FileDelete, %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	FileAppend,	%filename% , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	;Clipboard復帰
	Clipboard = %cb_bk%
}

;ショートカットを開く
ClipExt_openAlias(num){
	FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	run, %file%
}

;ClipBoard履歴ログの表示
ClipExt_openLog(){
	run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\Log\clip.log
	sleep,500
	Send,^{End}
}