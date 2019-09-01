;WEB操作関係

;youtube動画DL
download(){
	Send, ^l
	clipboard =
	Send, ^c
	ClipWait
	Run, "https://www.onlinevideoconverter.com/ja/mp3-converter?url=%clipboard%"
}

;タスク追加(Trello)
addTaskToTrello(){
	InputBox, taskname , Add task to trello, Please input task name,, 200, 130,,,,,
	if ErrorLevel <> 0
		return
	else {

		;ComObjを利用
		oHttp := ComObjCreate("WinHttp.Winhttprequest.5.1")

		;直近のworkボードから最左にあるリストのIDをlatestListIdとして取得
		GET_URL := "https://trello.com/1/boards/" . getStringWriter("TRELLO_WORK_BOARD_ID") . "/lists?key=" . getStringWriter("TRELLO_API_KEY") . "&token=" . getStringWriter("TRELLO_API_TOKEN")
		oHttp.open("GET", GET_URL)
		oHttp.send()
		res := oHTTP.responseText
		StringGetPos, index, res, ":"
		beginIndex := index + 4
		StringMid, latestListId, res, beginIndex , 24

		;タスク名をエンコード
		enc_taskname := UriEncode(taskname)

		;最左のリストを指定してタスクを追加
		POST_URL := "https://trello.com/1/cards?key=" . getStringWriter("TRELLO_API_KEY") . "&token=" . getStringWriter("TRELLO_API_TOKEN") . "&idList=" . latestListId . "&name=" . enc_taskname

		oHTTP.Open("POST", POST_URL, 0)
		oHTTP.Send()
		msgBox, Task added.

	}
}

;URIエンコード用
UriEncode(Uri, Enc = "UTF-8"){
	StrPutVar(Uri, Var, Enc)
	f := A_FormatInteger
	SetFormat, IntegerFast, H
	Loop
	{
		Code := NumGet(Var, A_Index - 1, "UChar")
		If (!Code)
			Break
		If (Code >= 0x30 && Code <= 0x39 ; 0-9
			|| Code >= 0x41 && Code <= 0x5A ; A-Z
			|| Code >= 0x61 && Code <= 0x7A) ; a-z
			Res .= Chr(Code)
		Else
			Res .= "%" . SubStr(Code + 0x100, -1)
	}
	SetFormat, IntegerFast, %f%
	Return, Res
}

;URIエンコード用
StrPutVar(Str, ByRef Var, Enc = ""){
	Len := StrPut(Str, Enc) * (Enc = "UTF-16" || Enc = "CP1200" ? 2 : 1)
	VarSetCapacity(Var, Len, 0)
	Return, StrPut(Str, &Var, Enc)
}