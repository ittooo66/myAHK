;Remote等の環境へClipboard内容を入力していく
IntoRemoteDesktop(){
	StringCaseSense, On
	FileRead, content, %A_WorkingDir%\myAHKComponents\Resources\Clipboard\1.txt

	while(true){
		;prefixに頭を取得
		StringLeft, prefix, content, 1
		;contentから頭を削除
		StringTrimLeft , content, content, 1

		;500文字以上ある場合、止めておく
		if( strLen(content) > 1500 ){
			MsgBox,TooMuchChars!
			return
		}

		;該当文字列をSend命令に変更
		if(inStr(prefix,"a")){
			Send,{a}
		}else if(inStr(prefix,"A")){
			Send,+{a}
		}else if(inStr(prefix,"b")){
			Send,{b}
		}else if(inStr(prefix,"B")){
			Send,+{b}
		}else if(inStr(prefix,"c")){
			Send,{c}
		}else if(inStr(prefix,"C")){
			Send,+{c}
		}else if(inStr(prefix,"d")){
			Send,{d}
		}else if(inStr(prefix,"D")){
			Send,+{d}
		}else if(inStr(prefix,"e")){
			Send,{e}
		}else if(inStr(prefix,"E")){
			Send,+{e}
		}else if(inStr(prefix,"f")){
			Send,{f}
		}else if(inStr(prefix,"F")){
			Send,+{f}
		}else if(inStr(prefix,"g")){
			Send,{g}
		}else if(inStr(prefix,"G")){
			Send,+{g}
		}else if(inStr(prefix,"h")){
			Send,{h}
		}else if(inStr(prefix,"H")){
			Send,+{h}
		}else if(inStr(prefix,"i")){
			Send,{i}
		}else if(inStr(prefix,"I")){
			Send,{I}
		}else if(inStr(prefix,"j")){
			Send,{j}
		}else if(inStr(prefix,"J")){
			Send,+{j}
		}else if(inStr(prefix,"k")){
			Send,{k}
		}else if(inStr(prefix,"K")){
			Send,+{k}
		}else if(inStr(prefix,"l")){
			Send,{l}
		}else if(inStr(prefix,"L")){
			Send,+{l}
		}else if(inStr(prefix,"m")){
			Send,{m}
		}else if(inStr(prefix,"M")){
			Send,+{m}
		}else if(inStr(prefix,"n")){
			Send,{n}
		}else if(inStr(prefix,"N")){
			Send,+{n}
		}else if(inStr(prefix,"o")){
			Send,{o}
		}else if(inStr(prefix,"O")){
			Send,+{o}
		}else if(inStr(prefix,"p")){
			Send,{p}
		}else if(inStr(prefix,"P")){
			Send,+{p}
		}else if(inStr(prefix,"q")){
			Send,{q}
		}else if(inStr(prefix,"Q")){
			Send,+{q}
		}else if(inStr(prefix,"r")){
			Send,{r}
		}else if(inStr(prefix,"R")){
			Send,+{r}
		}else if(inStr(prefix,"s")){
			Send,{s}
		}else if(inStr(prefix,"S")){
			Send,+{s}
		}else if(inStr(prefix,"t")){
			Send,{t}
		}else if(inStr(prefix,"T")){
			Send,+{t}
		}else if(inStr(prefix,"u")){
			Send,{u}
		}else if(inStr(prefix,"U")){
			Send,+{u}
		}else if(inStr(prefix,"v")){
			Send,{v}
		}else if(inStr(prefix,"V")){
			Send,+{v}
		}else if(inStr(prefix,"w")){
			Send,{w}
		}else if(inStr(prefix,"W")){
			Send,+{w}
		}else if(inStr(prefix,"x")){
			Send,{x}
		}else if(inStr(prefix,"X")){
			Send,+{x}
		}else if(inStr(prefix,"y")){
			Send,{y}
		}else if(inStr(prefix,"Y")){
			Send,+{y}
		}else if(inStr(prefix,"z")){
			Send,{z}
		}else if(inStr(prefix,"Z")){
			Send,+{z}
		}else if(inStr(prefix,"0")){
			Send,{0}
		}else if(inStr(prefix,"1")){
			Send,{1}
		}else if(inStr(prefix,"2")){
			Send,{2}
		}else if(inStr(prefix,"3")){
			Send,{3}
		}else if(inStr(prefix,"4")){
			Send,{4}
		}else if(inStr(prefix,"5")){
			Send,{5}
		}else if(inStr(prefix,"6")){
			Send,{6}
		}else if(inStr(prefix,"7")){
			Send,{7}
		}else if(inStr(prefix,"8")){
			Send,{8}
		}else if(inStr(prefix,"9")){
			Send,{9}
		}else if(inStr(prefix," ")){
			Send,{Space}
		}else if(inStr(prefix,"(")){
			Send,{(}
		}else if(inStr(prefix,")")){
			Send,{)}
		}else if(inStr(prefix,"{")){
			Send,{{}
		}else if(inStr(prefix,"}")){
			Send,{}}
		}else if(inStr(prefix,"<")){
			Send,{<}
		}else if(inStr(prefix,">")){
			Send,{>}
		}else if(inStr(prefix,"`n")){
			Send,{Return}
		}else if(inStr(prefix,",")){
			Send,{,}
		}else if(inStr(prefix,".")){
			Send,{.}
		}else if(inStr(prefix,"`t")){
			Send,{Tab}
		}else if(inStr(prefix,"!")){
			Send,{!}
		}else if(inStr(prefix,"@")){
			Send,{@}
		}else if(inStr(prefix,"#")){
			Send,{#}
		}else if(inStr(prefix,"$")){
			Send,{$}
		}else if(inStr(prefix,"%")){
			Send,{`%}
		}else if(inStr(prefix,"^")){
			Send,{^}
		}else if(inStr(prefix,"&")){
			Send,{&}
		}else if(inStr(prefix,"*")){
			Send,{*}
		}else if(inStr(prefix,"-")){
			Send,{-}
		}else if(inStr(prefix,"/")){
			Send,{/}
		}else if(inStr(prefix,"?")){
			Send,{?}
		}else if(inStr(prefix,"'")){
			Send,{'}
		}else if(inStr(prefix,"""")){
			Send,+{'}
		}else if(inStr(prefix,"[")){
			Send,{[}
		}else if(inStr(prefix,"]")){
			Send,{]}
		}else if(inStr(prefix,"+")){
			Send,{+}
		}else if(inStr(prefix,"=")){
			Send,{=}
		}else if(inStr(prefix,"|")){
			Send,{|}
		}else if(inStr(prefix,"_")){
			Send,{_}
		}else if(inStr(prefix,"\")){
			Send,{\}
		}else if(inStr(prefix,"``")){
			Send,{``}
		}else{
			send,{Space}
		}

		;全文字入力し終わったら、終了。
		if( strLen(content) < 1 ){
			return
		}else if( getKeyState("Esc","P")){
			return
		}
	}
	StringCaseSense, Off
}

