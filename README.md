myAHK
======================
おれおれキーバインド。  
各種コンポーネントの中身については[README.md][README.md]を、キー入力時の挙動は[MANUAL.pptx][MANUAL.pptx]参照のこと。



使い方
------
+ `Main_AWKB.ahk`(for Apple Wireless Keyboard)   
または
+ `Main_HHKB.ahk`(for HHKB)

を起動。`myAHKComponents/`以下に依存。



### myAHKComponents/ ###
    IfWinActives/       :特定Window下における挙動
    Library.ahk         :べんり機能置き場
    MBind.ahk           :ほぼ本体。全体的な挙動
    MBindListener.ahk   :MBindを当てるためのリスナ
    Mouse.ahk           :マウス周りの挙動

### GamingAHK/ ###
ゲーム用のAHK集。本体と共存不可能になったので別個に起動。

### reference/ ###

なんかにつかえそうだなあAHK集。

+ [EnableUIAccess][EnableUIAccess]  
必須。AHKからUAC周りの制約を消せる。これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨になります

+ [MouseGestureL][MouseGestureL]  
マウスジェスチャできるやつ。多機能だけどマウスバインド充実しだしたしもう不要？

+ [IME.ahk][IME.ahk]  
IME切り替え用AHK。つよそうだけどつかってない

+ [WheelScroll.ahk][WheelScroll.ahk]  
ホイール周り（横スクロール）の強化。横スク不可のExcelを横スクロールできるようになる。PPTは無理っぽい、ナンデ。

+ Logger.ahk  
キーロガー（未完成）。さらなる効率化のための情報収集のためのツール（の予定）。

+ VDM.ahk  
仮想デスクトップ構築。

+ referenceIncludesXAI.ahk  
どこかのだれかのAHK。

+ InvertPadScroll.ahk  
パッドのスクロール逆転用のAHK


注意
----------------
1. 実行順序  
一番下が優先されるスタイルの模様。Karabinerと逆？強烈なバインドはなるべく上の方に来るように書く。#includeは宣言場所で展開されるようなので、このルールを踏まえ、展開場所に注意

2. 修飾キー周り  
略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。使用の際は注意を





[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/
[README.md]: https://github.com/ittooo66/myAHK/blob/master/README.md
[MANUAL.pptx]: https://github.com/ittooo66/myAHK/blob/master/MANUAL.pptx
