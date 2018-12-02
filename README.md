my[AHK][AHK]
======================
 Reinvent Key Bindings !

### HOW TO USE ###

1. [HHKB][HHKB]を購入します。  
※DIPスイッチは2をONにしています。

1. [AutoHotkey][AHK]をインストールします。

1. 本RepoをDownloadして、Main.ahkを実行します。

### / ###
実行ファイルと各種マニュアル

    Main.ahk          :実行ファイル
    MANUAL.pptx       :マニュアル

### myAHKComponents/ ###
実行ファイル（Main.ahk）がロードするComponent集

    MBind.ahk           :myAHK本体。全体的な挙動を記載。
    MBindListener.ahk   :MBindを当てるためのリスナ
    MbindSetting.ahk    :MBindの仮想修飾キーの設定ファイル

    IfWinActives/       :特定Window下におけるバインドセット
    Library/            :ライブラリ。仕様はコメントに記載
    Resources/          :Libraryで用いるリソース置き場。履歴コピペのdatとか登録済みランチャのディレクトリとか。

### gamingAHK/ ###
ゲーム用のAHK集。本体と共存不可能になったので別個に起動。

### \_souko/ ###

なんかにつかえそうだなあAHK集。代表的なものは以下。

+ [EnableUIAccess][EnableUIAccess]  
必須。AHKからUAC周りの制約を消せる。これ無いとAltTabが効かなかったりLoLで修飾キー周りが悲惨に。とおもったがもう不要説。

+ [MouseGestureL][MouseGestureL]  
マウスジェスチャできるやつ。多機能だけどマウスバインド充実しだしたしもう不要。AHKゴリゴリ使ってるので参考文献として優秀。

+ [IME.ahk][IME.ahk]  
IME切り替え用AHK。/Libraryに配置して利用中。

+ MY_LEGACY_AHK  
自作の旧AHK、不揮発変数使ったりSetTimerつかったり。


諸注意
----------------

1. あらかじめ[EnableUIAccess][EnableUIAccess]してから、起動する。もしくは管理者権限で起動。UAC周りの問題が山積してる.

    + 管理者実行の時にCOM周りが機能不全になる問題（PPT,Excelのスクロール問題）  
      →PPT,Excelのスクロール機能だけ切り出して、当てていく？
    + 非管理者実行では管理者権限APPにBindが刺さらない問題  
      →解決策なし、ってかふつうに考えれば当たり前。非管理者実行を前提として用いるしかないかなあ。
    + EnableUIAccess不要説。無くても割と動いてくれてる。AHK_"L"のおかげ？

1. CRLF or LF  
Gitの標準がLFなのでAHKの標準のCRLFと噛み合わずにzipとかで引き上げるときに揉める。以下対策。現状は前者。
    + `.git/config` ファイルにて `autoCRLF=false`
    + `git clone`はそのへん宜しくやってくれるっぽい

1. AHKのフック負けリスト
  + IME周り  
    Alt+\`,Ctrl+\`には勝てなかった。
  + Windowsキー関連  
    Win+L(画面ロック),Win+Enter(ナレーター)  
        + ナレーター機能はreg編集なしで解除できたが、ロック機能はreg編集しないとどうしようもなさそう...  
  + Windowsキー押上：3キー入力（e.g. LWin+RWin+g）時にフック力が足りずバインドからはみ出る。結果、Windowsメニューを開く事故が頻発。解決策がないためレジストリからLWin,RWinを無変換・変換に変更。  
    + 某環境のレジストリ変更が不可のため、RWin&LWin構成で気張る必要が発生。バインドはみ出る問題はWinキー完全無効化＋別キーでのフックで解決した。

1. AHK内のフック力強弱
  + `#IfWinActive内部` > `通常記述`
  + `>!` < `RAlt`  略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。現状は`MBindListener.ahk`で仕様を吸収してはいるけど、使用の際は注意を。

1. AHK Version
  + Lのほうじゃないと今はもう動かない（PPT,EXCELのスクロールにCOMつかってるため）

1. SetTimer機能
  + Pollingやってるせいなのか何なのかわからんけど、使ってるとFPS系のカーソルが荒ぶる？
  必要性が微妙なのであんまり使わないほうがいいかも

[HHKB]: http://www.pfu.fujitsu.com/hhkeyboard/
[AHK]: https://github.com/Lexikos/AutoHotkey_L
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/