my[AHK][AHK]
======================
my Key Bindings


### HOW TO USE ###
---

1. BUY [HHKB][HHKB]
1. INSTALL [AHK][AHK]
1. DOWNLOAD THIS REPOSITORY
1. EXECUTE Main.ahk



### 仕様 ###
---

+ __MANUAL.pptx__

  外部仕様を記載しています。内部仕様はここに記載。

+ __Main.ahk__

  実行ファイル。基本的なバインド設定と#include設定のみを記載。

+ __myAHKComponents/__

  実行ファイル（Main.ahk）がロードする以下のComponentを格納。

      MBind.ahk           :myAHK本体。全体的な挙動を記載。
      MBindListener.ahk   :MBindを当てるためのリスナ。
      MbindSetting.ahk    :MBindの仮想修飾キーの設定ファイル。
      IfWinActives/       :特定Windowにだけ適用するバインドセット。
      Library/            :追加機能群はここにいれる。仕様はコメントをみること。
      Resources/          :各機能で利用するリソース置き場。Alias,Log,ps1など。

+ ___old/__

  倉庫。




### 諸注意 ###
---

1. CRLF or LF  
Gitの標準がLFなのでAHKの標準のCRLFと噛み合わずにzipでDownloadする時にもにょる。以下対策。現状は前者。
    + `.git/config` ファイルにて `autoCRLF=false`
    + powershellで`git clone`するとそのへん宜しくやってくれるっぽい

1. AHKのフック負けリスト   
    
    + IME切替  
        Alt+\`,Ctrl+\`には勝てない。    
    + Win+L(画面ロック),Win+Enter(ナレーター)  
          ナレーター機能はreg編集なしで解除できたが、ロック機能はreg編集しないとどうしようもない。
    
1. 修飾キー特性  
    + __Windowsキー__  
      LWin、RWinと複合したバインドを律儀に定義するとバインド回収が漏れて暴発する。AHK側ではWinキーの入力そのものを無効化して、GetKeyStateで入力状態を見て適宜修飾キーとして利用するのが一番安定する
    + __Altキー__  
      押下が漏れるらしく、Altを他バインドに変換してもAltおされっぱ扱いになるっぽい。AltはAltとして利用する方針で対処
    + __Capslockキー__  
      入力が一番安定しない。Windowsキーと同様、AHK側での個別制御をせず、sc03aのGetKeyStateで入力状態を検知して対応  
    + __変換・無変換__  
      HHKBにはないが、JISキー系に対応するため、MBindSettings.ahkにはとりあえず定義している。割と無害で素直。

1. AHK内のフック力強弱
    + `#IfWinActive内部` > `通常記述`
      上記の仕様を利用して`IfWinActives/`の構成でAP個別のバインドを実施中。
    + `>!` < `RAlt`  
      略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。現状は`MBindListener.ahk`で仕様を吸収してはいるけど、使用の際は注意を。

1. AHK Version
    + PPT,EXCELのスクロールにCOMつかってるので、Lの方じゃないともう動かない。

1. SetTimer機能
    + Pollingやってるせいなのか何なのかわからんけど、使ってるとFPS系のカーソルが荒ぶる？
    必要性が微妙なのであんまり使わないほうがいいかも

1. [EnableUIAccess][EnableUIAccess]  

    + UAC周りの問題対処用。
    + 管理者実行の時にCOM周りが機能不全になる問題（PPT,Excelのスクロール問題）  
      →PPT,Excelのスクロール機能だけ切り出して、当てていく？  
      →無理っぽい。
    + 非管理者実行では管理者権限APPにBindが刺さらない問題  
      →解決策なし、ってかふつうに考えれば当たり前。非管理者実行を前提として用いるしかないかなあ。  
    + EnableUIAccess不要説。無くても割と動いてくれてる。AHK_"L"のおかげ？


[HHKB]: http://www.pfu.fujitsu.com/hhkeyboard/
[AHK]: https://github.com/Lexikos/AutoHotkey_L
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html
[MouseGestureL]: http://hp.vector.co.jp/authors/VA018351/mglahk.html
[EnableUIAccess]: http://www.autohotkey.com/board/topic/70449-enable-interaction-with-administrative-programs/