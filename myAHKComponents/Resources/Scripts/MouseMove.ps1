# https://kenko-keep.com/mouse-auto/
# https://yomon.hatenablog.com/entry/2014/07/05/003404


# System.Windows.Formsをロード（.NETのCursorクラスを利用のため）
add-type -AssemblyName System.Windows.Forms

# マウスカーソルの現在位置を取得
$x = [System.Windows.Forms.Cursor]::Position.X + $Args[0]
$y = [System.Windows.Forms.Cursor]::Position.Y + $Args[1]
  
[System.Windows.Forms.Cursor]::Position = new-object System.Drawing.Point($x, $y)
