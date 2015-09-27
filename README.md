# myAHK

##本体

###Main.ahk
実行用。基本的なバインドはちょっと展開しちゃってる。IncludeしてるやつはmyAHKComponents以下。
####Mouse.ahk
マウスバインド及びマウス操作のスクリプト。
####IfWinActive/
App固有のバインド
####Library.ahk
Google検索とかクリップボードとか。
####MBind.ahk/MBindListener.ahk
基本的なバインドはここに全部。それぞれ
####GamingAHK
ゲーム用。本体は弄りすぎて共存不可能になったのでここで別個起動


・MBind.ahk：挙動内容書いてある。RCMDとかで割りと綺麗に定義可能

・MBindListener：引っ掛けてくる部分。RControlとか>^とかがわっさ～～～

####myAHKComponents各種ディレクトリ

・FileAlias : 2cmdランチャの指定ディレクトリが入ってる

・Clipboard : 拡張Clipboardの記録内容が入ってる

##外部AHK(in reference)

###Enable UI Access
UAC周りの制約を撤廃するためのもの（Windows7以降用？）

これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨になります

###MouseGestureL
マウスジェスチャががっつり入る

他のAHKと干渉気味になるので現在様子見中

###VDM.ahk
仮想デスクトップ。これなんかに使えそうな気がしなくなくなくもない

###InvertPadScroll.ahk
MBPRのスクロール逆転用

###Logger.ahk
キーロガー（未完成）。さらなる効率化のための情報収集のためのツール（の予定）。

###WheelScroll.ahk
ホイール周り（横スクロール）の強化。横スク不可のExcelを横スクロールできるようになる（らしい）。PPTは無理っぽい、ナンデ。

##諸注意
・実行順序：下から順に引っかかっていくスタイルの模様。Karabinerと逆？強烈なバインドはなるべく上の方に来るように書きましょう

・#includeは宣言場所で展開されるようなので、上記のルールを踏まえ、展開場所に注意

・修飾キー周り：略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。使用の際は注意を
