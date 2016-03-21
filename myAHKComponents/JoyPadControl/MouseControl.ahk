;マウスカーソルの制御。左スティックに依存

WatchX:
WatchY:
	GetKeyState, JoyX, JoyX  ; Stick1の左右（0が左、100が右。25~75はほぼ非可動）
	GetKeyState, JoyY, JoyY  ; Stick1の上下（0が上、100が下。25~75はほぼ非可動）

	

return
