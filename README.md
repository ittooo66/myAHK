my[AHK][AHK]
======================
### おれおれキーバインド。###

    Main.ahk          :実行ファイル
    README.md         :各AHKの役割  
    MANUAL.pptx       :キー入力時の挙動

### myAHKComponents/ ###
本体（Main.ahk）が依存してるComponent集

    IfWinActives/       :特定Window下における挙動
    Library/            :べんり機能置き場。依存してる外部ライブラリもここに。
    Resources/          :各種機能で用いるファイル。履歴コピペのdatとか登録済みランチャのディレクトリとか。

    MBind.ahk           :ほぼ本体。全体的な挙動
    MBindListener.ahk   :MBindを当てるためのリスナ
    MbindSetting.ahk    :MBindの仮想修飾キーの設定ファイル

    KANAMouse.ahk       :Kanaマウスの挙動
    GUILabel.ahk        :GUIのラベル系、起動時には実行されないやつら。


### GamingAHK/ ###
ゲーム用のAHK集。本体と共存不可能になったので別個に起動。

### reference/ ###

なんかにつかえそうだなあAHK集。依存しているものは
`myAHKComponents/ExtLibs/`にお引っ越し中。

+ [EnableUIAccess][EnableUIAccess]  
必須。AHKからUAC周りの制約を消せる。これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨に  

+ [MouseGestureL][MouseGestureL]  
マウスジェスチャできるやつ。多機能だけどマウスバインド充実しだしたしもう不要。AHKゴリゴリ使ってるので参考文献として優秀。

+ [IME.ahk][IME.ahk]  
IME切り替え用AHK。つよい。べんり。使用中。

+ [WheelScroll.ahk][WheelScroll.ahk]  
ホイール周り（横スクロール）の強化。横スク不可のExcelを横スクロールできるようになる。PPTは無理っぽい、ナンデ。使用中。

など。

各種注意
----------------
1. HHKBのDIPスイッチ  
2と6がON

1. あらかじめ[EnableUIAccess][EnableUIAccess]してから、起動する

1. レジストリ周りの依存  
両Winキー（ダイヤ部）を変換、無変換に変更（Chgkey.exeを使用した）

1. CRLF or LF  
LFだとAHKが改行認識できないのかパースおかしくなってすんごいたくさんエラー出る。`git clone`はそのへん宜しくやってくれるっぽいけどZipダウンロードの時は注意

1. 実行順序  
一番下が優先されるスタイルの模様。Karabinerと逆？強烈なバインドはなるべく上の方に来るように書く。#includeは宣言場所で展開されるようなので、このルールを踏まえ、展開場所に注意

1. 修飾キー周り  
略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。使用の際は注意を

1. フック負けリスト
  + IME周り：Alt+\`,Ctrl+\`には勝てない模様。
  + Win+L(画面ロック),Win+Enter(ナレーター), ともにレジストリいじってオフにはできる
  + Windowsキー押上：3キー入力（e.g. LWin+RWin+g）時にフック力が足りずバインドからはみ出る。結果、Windowsメニューを開く事故が頻発。解決策がないためレジストリからLWin,RWinを無変換・変換に変更。

1. 記法によるフック力強弱
  + `>!` < `RAlt`


1. AHK Version
  +Lのほうじゃないともう多分動かない（PPT,EXCELのスクロールにCOMつかってるため）



[AHK]: https://github.com/AutoHotkey/AutoHotkey
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/
