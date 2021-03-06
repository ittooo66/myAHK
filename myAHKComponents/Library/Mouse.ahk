;マウス操作関係

;ウィンドウサイズ変更
;ディスプレイ設定(DPIスケール、モニタ配置)に大幅に依存してるので、注意
changeWindowSize(){

	;画面情報を取得
	;X,Y:スケーリング後のアクティブウインドウの左上のピクセル位置（モニタ1の左上(0,0)からのX:Y座標）
	;W,H:スケーリング後のアクティブウインドウ幅(W),高さ(H)
	WinGetActiveStats, Title, W, H, X, Y

	;4Kモニタ側の設定の場合
	if(X<-1280){
		;mousemoveのX=0,Y=0がスケーリングでずれるため、以下の係数で修正する。
		;DPIスケール150%,メインモニタが右上にある状態で左の4Kモニタに対してのみ有効
		rawX:=(3840+X)/2+1
		rawY:=Y/2+1

	;FHDモニタ側の設定の場合
	}else{
		rawX:=2
		rawY:=0
	}

	BlockInput, MouseMove
	Mousemove,%rawX%,%rawY%,0
	Send,{LButton Down}
	BlockInput, MouseMoveOff
	while(MSBLF() && MSBLB()){
		sleep,30
	}
	Send,{LButton Up}
}

;ウィンドウの移動
moveWindow(){
	Send,{Alt Down}
	Send,{Space}
	Sleep, 100
	Send,{m}
	Send,{Alt Up}
	Send,{Left}{Right}
}

;key: イベント対象のキー4つ
mouseMove(keyUp,keyDown,keyLeft,keyRight,val=1,slp=10){

	;Mouse関連機能を絶対座標モードに変更
	CoordMode,Mouse,Screen

	;各モニタの表示倍率値(DPIScale取得が各モニタ毎にできなかったのでこの形式)
	monitor1_dpi := 1
	monitor2_dpi := 1.5

	;各モニタの設定値を取得(paramが逆っぽいのでこの形式)
	sysget, mon1,Monitor, 1
	sysget, mon2,Monitor, 2

	;各モニタの幅・高さを取得
	monitor1_width := (mon1Right - mon1Left)*monitor1_dpi
	monitor1_height := (mon1Bottom - mon1Top)*monitor1_dpi
	monitor2_width := (mon2Right - mon2Left)*monitor2_dpi
	monitor2_height := (mon2Bottom - mon2Top)*monitor2_dpi

	while(GetKeyState(keyUp,"P") || GetKeyState(keyDown,"P") || GetKeyState(keyLeft,"P") || GetKeyState(keyRight,"P")){

		;Mouseの座標を取得(中途半端にDPIスケールがかかっている)
		MouseGetPos,X,Y,,,1

		;現在のマウスの座標(画面左上からのpixel値：mouseW,mouseH)を取得
		if( mon1Left < X && X < mon1Right && mon1Top < Y && Y < mon1Bottom){
			;Monitor1のとき
			mouseW := X*monitor1_dpi
			mouseH := Y*monitor1_dpi
			MoveX := MouseW+mon1Left, MoveY := MouseH+mon1Top
		}else{
			;Monitor2のとき
			mouseW := (X-mon2Left)*monitor2_dpi
			mouseH := (Y-mon2Top)*monitor2_dpi
			MoveX := MouseW+mon2Left, MoveY := MouseH+mon2Top
		}

		;移動
		MoveY += GetKeyState(keyUp, "P") ? -val : 0
		MoveX += GetKeyState(keyLeft, "P") ? -val : 0
		MoveY += GetKeyState(keyDown, "P") ? val : 0
		MoveX += GetKeyState(keyRight, "P") ? val : 0

		;絶対座標指定でマウス移動
		MouseMove, %MoveX%, %MoveY%, 0

		;Control系処理
		Sleep, %slp%
		val++
	}
}

;key: イベント対象のキー4つ
mouseMoveFast(keyUp,keyDown,keyLeft,keyRight){
	mouseMove(keyUp,keyDown,keyLeft,keyRight,50,10)
}

;マウスカーソルを中央に配置
mouseCursorResetToCenter(){

	;Mouse関連機能を絶対座標モードに変更
	CoordMode,Mouse,Screen

	;各モニタの表示倍率値(DPIScale取得が各モニタ毎にできなかったのでこの形式)
	monitor1_dpi := 1
	monitor2_dpi := 1.5

	;各モニタの設定値を取得(paramが逆っぽいのでこの形式)
	sysget, mon1,Monitor, 2
	sysget, mon2,Monitor, 1

	;各モニタの幅・高さを取得
	monitor1_width := (mon1Right - mon1Left)*monitor1_dpi
	monitor1_height := (mon1Bottom - mon1Top)*monitor1_dpi
	monitor2_width := (mon2Right - mon2Left)*monitor2_dpi
	monitor2_height := (mon2Bottom - mon2Top)*monitor2_dpi

	;Mouseの座標を取得(中途半端にDPIスケールがかかっている)
	MouseGetPos,X,Y,,,1

	;中央の絶対座標(画面左上からのpixel値：mouseW,mouseH)を取得
	if( mon1Left < X && X < mon1Right && mon1Top < Y && Y < mon1Bottom){
		;Monitor1のとき
		mouseW := mon1Left+monitor1_width/2
		mouseH := mon1Top+monitor1_height/2
	}else{
		;Monitor2のとき
		mouseW := mon2Left+monitor2_width/2
		mouseH := mon2Top+monitor2_height/2
	}
	;Mouseを中央に移動
	MouseMove, %mouseW%, %mouseH%, 0
}

;マウスの左クリックエミュレート
mousePress(leftButtonKey){
	Send,{LButton Down}
	while(GetKeyState(leftButtonKey,"P")){
		Sleep,100
	}
	Send,{LButton Up}
}
