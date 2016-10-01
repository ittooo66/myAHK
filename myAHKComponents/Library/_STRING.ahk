
;IfinStringのラッパー、IfInStringの動作が安定しなかったので作った
;=>stringにkeyが入ってるとき　true
;=>stringにkeyが入っていないとき　false
inStr(string,key){
	IfInString, string, %key%
	{
		return true
	}
	return false
}

;マルチバイト文字変換
transMB(str)
{

	;--- 文字コード変換 ---
	fsave := A_FormatInteger
	SetFormat, integer, D       ;全角用 {ASC xxxx} は10進書出し

	p := &str
	Loop
	{
		if(*p = 0)
			break

		if (0x81 <= *p && *p <= 0x9F) || (0xE0 <= *p && *p <= 0xFC)
		{    ;--- 全角 ---
			res := res . "{ASC " . (*p << 8) + *(p+1) . "}"
			p++
		}
		else ;--- 半角 ---
		{
			char := chr(*p)
			if (0x80 < *p)
				res := res . "{ASC " . *p . "}"
			else if char in   !,#,+,^,{,}
				res := res . "{" . char . "}"
			else if (char = "`n")
				res := res . "{Enter}"
			else if (char != "`r")
				res := res . char
		}
		p++
	}
	SetFormat, integer, %fsave%

	return res
}