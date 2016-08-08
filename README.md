my[AHK][AHK]
======================
 Reinvent Key Bindings !

### HOW TO USE ###

1. [HHKB][HHKB]を購入します。  
※DIPスイッチは2と6をONにしています。

2. [Chgkey.exe][ChgKey.exe]を使用してRWin,LWin周りの修飾キーを弄ります。  
※変換一覧
```
RWin              -> 変換(vkFFsc079)
変換(vkFFsc079)   -> RWin
LWin              -> 無変換(vkEBsc07B)
無変換(vkEBsc07B)  -> LWin
```

3. [AutoHotkey][AHK]をインストールします。

4. 本RepoをDownloadして、Main.ahkを実行します。

### / ###
実行ファイルと各種マニュアル

    Main.ahk          :実行ファイル
    MANUAL.pptx       :マニュアル。どこ押すと何が起きるか書いてあるだけだけど。

### myAHKComponents/ ###
実行ファイル（Main.ahk）が依存してるComponent集

    MBind.ahk           :ほぼ本体。全体的な挙動
    MBindListener.ahk   :MBindを当てるためのリスナ
    MbindSetting.ahk    :MBindの仮想修飾キーの設定ファイル

    IfWinActives/       :特定Window下におけるバインドセット
    Library/            :ライブラリです。仕様は各AHKCodeのコメントを参考に…
    Resources/          :Libraryで用いるリソース置き場。履歴コピペのdatとか登録済みランチャのディレクトリとか。

    JoyPadControl/      :Joypad周りのAHK。副作用が大きいので現状はDisableしてる。

    MouseBindings.ahk   :マウスの挙動
    GUILabel.ahk        :GUIのラベル系、起動時には実行されないやつら。

### GamingAHK/ ###
ゲーム用のAHK集。本体と共存不可能になったので別個に起動。

### Reference/ ###

なんかにつかえそうだなあAHK集。代表的なものは以下。

+ [EnableUIAccess][EnableUIAccess]  
必須。AHKからUAC周りの制約を消せる。これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨に  

+ [MouseGestureL][MouseGestureL]  
マウスジェスチャできるやつ。多機能だけどマウスバインド充実しだしたしもう不要。AHKゴリゴリ使ってるので参考文献として優秀。

+ [IME.ahk][IME.ahk]  
IME切り替え用AHK。つよい。

など。

諸注意
----------------

1. あらかじめ[EnableUIAccess][EnableUIAccess]してから、起動する
もしくは管理者権限で起動。UAC周りの問題が山積してるのであとでどうにかすること．  
    + 管理者実行の時にCOM周りが機能不全になる問題（PPT,Excelのスクロール問題）
    + 非管理者実行では管理者権限APPにBindが刺さらない問題

1. CRLF or LF  
Gitの標準がLFなのでAHKの標準のCRLFと噛み合わずにzipとかで引き上げるときに揉める。以下対策。現状は前者。
    + `.git/config` ファイルにて `autoCRLF=false`
    + `git clone`はそのへん宜しくやってくれるっぽい

1. AHKのフック負けリスト
  + IME周り：Alt+\`,Ctrl+\`には勝てなかった。
  + Win+L(画面ロック),Win+Enter(ナレーター), ともにレジストリいじってオフにはできる。
  + Windowsキー押上：3キー入力（e.g. LWin+RWin+g）時にフック力が足りずバインドからはみ出る。結果、Windowsメニューを開く事故が頻発。解決策がないためレジストリからLWin,RWinを無変換・変換に変更。

1. AHK内のフック力強弱
  + `#IfWinActive内部` > `通常記述`
  + `>!` < `RAlt`  略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。現状は`MBindListener.ahk`で仕様を吸収してはいるけど、使用の際は注意を。

1. AHK Version
  + Lのほうじゃないと今はもう動かない（PPT,EXCELのスクロールにCOMつかってるため）


[HHKB]: http://www.pfu.fujitsu.com/hhkeyboard/
[AHK]: https://github.com/Lexikos/AutoHotkey_L
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/
[Chgkey.exe]:http://www.forest.impress.co.jp/library/software/changekey/
