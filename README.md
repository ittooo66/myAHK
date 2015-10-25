my[AHK][AHK]
======================
### おれおれキーバインド。###

    README.md      :各AHKの役割  
    MANUAL.pptx    :キー入力時の挙動

使い方
------
+ `Main.ahk`(for HHKB)

を起動。`myAHKComponents/`以下に依存。  
全ファイルCRLFにする！(ZIPダウンロードすると大変なことに)

### myAHKComponents/ ###

    IfWinActives/       :特定Window下における挙動
    Library.ahk         :べんり機能置き場
    MBind.ahk           :ほぼ本体。全体的な挙動
    MBindListener.ahk   :MBindを当てるためのリスナ
    MbindSetting.ahk    :MBindの仮想修飾キーの設定ファイル
    Mouse.ahk           :マウス関連の挙動

### GamingAHK/ ###
ゲーム用のAHK集。本体と共存不可能になったので別個に起動。

### reference/ ###

なんかにつかえそうだなあAHK集。依存しているものは
`myAHKComponents/ExtLibs/`に引っ越して使う。

+ [EnableUIAccess][EnableUIAccess]  
必須。AHKからUAC周りの制約を消せる。これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨に  

+ [MouseGestureL][MouseGestureL]  
マウスジェスチャできるやつ。多機能だけどマウスバインド充実しだしたしもう不要？

+ [IME.ahk][IME.ahk]  
IME切り替え用AHK。つよい。べんり。

+ [WheelScroll.ahk][WheelScroll.ahk]  
ホイール周り（横スクロール）の強化。横スク不可のExcelを横スクロールできるようになる。PPTは無理っぽい、ナンデ。

+ Logger.ahk  
キーロガー（未完成）。

+ VDM.ahk  
仮想デスクトップ。

+ referenceIncludesXAI.ahk  
どこかのだれかのAHK。

+ InvertPadScroll.ahk  
パッドのスクロール逆転用のAHK

+ TrackWheel


各種注意
----------------
1. 実行順序  
一番下が優先されるスタイルの模様。Karabinerと逆？強烈なバインドはなるべく上の方に来るように書く。#includeは宣言場所で展開されるようなので、このルールを踏まえ、展開場所に注意

2. 修飾キー周り  
略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。使用の際は注意を

3. フック負けリスト
  + IME周り：Alt+\`,Ctrl+\`には勝てない模様。
  + Windows系：Win+L(画面ロック),Win+Enter(ナレーター), ともにレジストリいじってオフに

4. HHKBのDIPスイッチ  
2と6がON

5. 記法によるフック力強弱
  + `>!` < `RAlt`



[AHK]: https://github.com/AutoHotkey/AutoHotkey
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/
