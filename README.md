### HOW TO USE ###
---

1. BUY [HHKB][HHKB]
1. INSTALL [AHK][AHK]
1. DOWNLOAD THIS REPOSITORY
1. EXECUTE Main.ahk



### 仕様 ###
---

+ __MANUAL.pptx__

  外部仕様を記載しています。

+ __Main.ahk__

  実行ファイル。基本的なバインド設定と`#include`設定を記載。

+ __myAHKComponents/__

  実行ファイル（Main.ahk）がロードする以下のComponentを格納。

      MBind.ahk           :本体。全体的な挙動を記載
      MBindListener.ahk   :MBindを当てるためのリスナ
      MbindSetting.ahk    :MBindの仮想修飾キーの設定ファイル
      IfWinActives/       :特定Windowのみ適用するバインド
      Library/            :追加機能のライブラリ
      Resources/          :各機能で利用するリソース置き場

+ ___old/__

  倉庫。




### 諸注意 ###
---

1. CRLF or LF  
GitがLFなのでAHKのCRLFと噛み合わずにzipでDownloadする時にもにょる。対策は以下。現状は前者。
    + `.git/config` にて `autoCRLF=false`
    + powershellで`git clone`するとよしなにやってくれるっぽい

1. AHKのフック負けリスト   
    
    + IME切替  
        Alt+\`,Ctrl+\`には勝てない。  
    + Win+L(画面ロック)  
        ナレーター機能(Win+Enter)などはreg編集なしで解除できるが、ロック機能は要reg編集。reg編集不可の環境では負ける。
    
1. 修飾キー特性  
    + __Windows__  
      LWin、RWinと複合したバインドを律儀に定義するとバインド回収が漏れて暴発する。AHK側ではWinキーの入力そのものを無効化して、GetKeyStateで入力状態を見て適宜修飾キーとして利用するのが一番安定する
    + __Alt__  
      押下が漏れるらしく、Altを他バインドに変換してもAltおされっぱ扱いになるっぽい。AltはAltとして利用する方針で対処
    + __Capslock__  
      入力が一番安定しない。Windowsキーと同様、原則無効化でAHK側での個別制御をせず、sc03aのGetKeyStateで入力状態を検知して対応  
    + __変換・無変換__  
      HHKBにはないが、JISキー系に対応するため、MBindSettings.ahkにはとりあえず定義している。割と無害で素直。

1. AHK内のフック力強弱
    + `#IfWinActive内部` > `通常記述`  
      上記の仕様を利用して`IfWinActives/`の構成でAP個別のバインドを実施中。
    + `>!` < `RAlt`  
      略記法(>+)と正式記法(RShift &)でフック力が違うのか等価の挙動にならない（略記のが低層フック？）。現状は`MBindListener.ahk`で仕様を吸収してはいるけど、使用の際は注意を。

1. AHK Version
    + AHK 1.1.32.00 対応

1. SetTimer機能
    + Pollingやってるせいなのか何なのかわからんけど、使ってるとFPS系のカーソルが荒ぶる（？）ので、FPS系のゲームと併存できない


[HHKB]: http://www.pfu.fujitsu.com/hhkeyboard/
[AHK]: https://github.com/Lexikos/AutoHotkey_L
[WheelScroll.ahk]: http://blechmusik.hatenablog.jp/entry/20100529/1275141213
[IME.ahk]: http://www6.atwiki.jp/eamat/pages/17.html