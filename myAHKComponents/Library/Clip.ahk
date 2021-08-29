;Clipboard関連の追加機能

;コピー
ClipExt_copy(){
	;ClipboardにCopy
	Send,^c
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;ログ追記
	logger(Clipboard , "clip")
}

;切り取り
ClipExt_cut(){
	;ClipboardにCut
	Send,^x
	;0.5secクリップボードの中身が入ってくるまで待つ。第二引数はClipboardAllタイプの変数を待つ、の証(1)
	ClipWait 0.5, 1
	;ログ追記
	logger(Clipboard , "clip")
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
	;ログ追記
	logger(Clipboard , "clip")
	;ファイルにClipboardを保存
	FileAppend, %ClipboardAll%, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
	;cb_bkから取得
	Clipboard = %cb_bk%
}

;拡張クリップボード(paste)
ClipExt_pasteFrom(num){
	;Spaceキーのスタックを消費
	consumeSpace()
	;暴発防止のSleep
	sleep, 250
	if SPACE(){
		;content取得
		FileRead, content ,*c %A_WorkingDir%\myAHKComponents\Resources\Clipboard\%num%.dat
		;content出力
		directInput(content)
	}
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
	;filepathの書き出し
	param := "CLIPEXT_ALIAS_" . num
	setEnv(param,clipboard)
	;Clipboard復帰
	Clipboard = %cb_bk%
}

;ショートカットを開く
ClipExt_openAlias(num){
	param := "CLIPEXT_ALIAS_" . num 
	filepath := getEnv(param)
	run, %filepath%
}

;ClipBoard履歴ログの表示
ClipExt_openLog(){
	run notepad.exe %A_WorkingDir%\myAHKComponents\Resources\Log\clip.log
	sleep,500
	Send,^{End}
}
