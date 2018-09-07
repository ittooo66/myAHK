;Windows+Dを強化
winD := 0
winD(){
	global winD
	if(winD==1){
		WinGet, id, List,,, Program Manager
	 	Loop, %id%
	 	{
	 		this_id := id%A_Index%
			WinActivate, ahk_id %this_id%
	 	}
		winD := 0
	}else{
		WinMinimizeAll
		;Desktopをフォーカス
		WinActivate, ahk_class WorkerW
		winD := 1
	}
}

;ショートカット生成
addAlias(num){
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
openAlias(num){
	FileRead, file , %A_WorkingDir%\myAHKComponents\Resources\FileAlias\%num%.txt
	run, %file%
}
