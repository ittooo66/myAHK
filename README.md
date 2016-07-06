my[AHK][AHK]
======================
### Reinvent Key Bindings !###

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

    MouseBindings.ahk       :Kanaマウスの挙動
    GUILabel.ahk        :GUIのラベル系、起動時には実行されないやつら。

### GamingAHK/ ###
ゲーム用のAHK集。本体と共存不可能になったので別個に起動。

### Reference/ ###

なんかにつかえそうだなあAHK集。

+ [EnableUIAccess][EnableUIAccess]  
必須。AHKからUAC周りの制約を消せる。これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨に  

+ [MouseGestureL][MouseGestureL]  
マウスジェスチャできるやつ。多機能だけどマウスバインド充実しだしたしもう不要。AHKゴリゴリ使ってるので参考文献として優秀。

+ [IME.ahk][IME.ahk]  
IME切り替え用AHK。つよい。

など。

外部依存
----------------
1. HHKBのDIPスイッチ  
2と6がON

1. レジストリ周りの依存([Chgkey.exe][Chgkey.exe]の使用)  
変換一覧
```
RWin              -> 変換(vkFFsc079)
変換(vkFFsc079)   -> RWin
LWin              -> 無変換(vkEBsc07B)
無変換(vkEBsc07B)  -> LWin
```

諸注意
----------------

1. あらかじめ[EnableUIAccess][EnableUIAccess]してから、起動する
もしくは管理者権限で起動。UAC周りの問題が山積してるのであとでどうにかすること．  
    + 管理者実行の時にCOM周りが機能不全になる問題（PPT,Excelのスクロール問題）
    + 非管理者実行では管理者権限APPにBindが刺さらない問題

1. CRLF or LF  
Gitの標準がLFなのでAHKの標準のCRLFと噛み合わずにZipとかで引き上げるときに揉める。対策として
    + `.git/config` ファイルにて `autoCRLF=false`
    + `git clone`はそのへん宜しくやってくれるっぽい

 現状は前者。

1. AHKのフック負けリスト

  + IME周り：Alt+\`,Ctrl+\`には勝てない模様。
  + Win+L(画面ロック),Win+Enter(ナレーター), ともにレジストリいじってオフにはできる
  + Windowsキー押上：3キー入力（e.g. LWin+RWin+g）時にフック力が足りずバインドからはみ出る。結果、Windowsメニューを開く事故が頻発。解決策がないためレジストリからLWin,RWinを無変換・変換に変更。

1. AHK内のフック力強弱
  + `#IfWinActive内部` > ``通常記述`
  + `>!` < `RAlt`
略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。使用の際は注意を

1. AHK Version
  + Lのほうじゃないともう多分動かない（PPT,EXCELのスクロールにCOMつかってるため）



[AHK]: https://github.com/AutoHotkey/AutoHotkey
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/
[Chgkey.exe]:http://www.forest.impress.co.jp/library/software/changekey/
