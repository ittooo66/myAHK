MG_IniFileVersion=1.30
MG_8Dir=0
MG_ActiveAsTarget=0
MG_Interval=1
MG_Threshold=1
MG_LongThresholdX=800
MG_LongThresholdY=600
MG_LongThreshold=700
MG_TimeoutThreshold=1
MG_Timeout=400
MG_DGInterval=0
MG_ORangeDefault=3
MG_ORangeA=3
MG_ORangeB=3
MG_EdgeInterval=20
MG_EdgeIndiv=0
MG_CornerX=1
MG_CornerY=1
MG_DisableDefMB=0
MG_DisableDefX1B=0
MG_DisableDefX2B=0
MG_UseNavi=0
MG_UseExNavi=3
MG_NaviInterval=10
MG_NaviPersist=0
MG_ExNaviTransBG=1
MG_ExNaviFG=000000
MG_ExNaviBG=FFFFFF
MG_ExNaviTranspcy=255
MG_ExNaviSize=24
MG_ExNaviSpacing=2
MG_ExNaviPadding=4
MG_ExNaviMargin=8
MG_AdNaviFG=FFFFFF
MG_AdNaviNI=7F7F7F
MG_AdNaviBG=000000
MG_AdNaviTranspcy=220
MG_AdNaviSize=12
MG_AdNaviFont=Meiryo
MG_AdNaviPosition=0
MG_AdNaviPaddingL=6
MG_AdNaviPaddingR=6
MG_AdNaviPaddingT=3
MG_AdNaviPaddingB=3
MG_AdNaviRound=1
MG_AdNaviMargin=14
MG_AdNaviSpaceX=2
MG_AdNaviSpaceY=2
MG_AdNaviOnClick=0
MG_ShowTrail=1
MG_DrawTrailWnd=1
MG_TrailColor=00FF00
MG_TrailTranspcy=255
MG_TrailWidth=3
MG_TrailStartMove=3
MG_TrailInterval=10
MG_ShowLogs=0
MG_LogPosition=4
MG_LogPosX=0
MG_LogPosY=0
MG_LogMax=20
MG_LogSizeW=400
MG_LogInterval=500
MG_LogFG=FFFFFF
MG_LogBG=000000
MG_LogTranspcy=100
MG_LogFontSize=10
MG_LogFont=MS UI Gothic
MG_HotkeyEnable=
MG_HotkeyNavi=
MG_ScriptEditor=
MG_UserName=
MG_Password=
MG_TraySubmenu=0
MG_AdjustDlg=0
MG_DlgHeightLimit=800
MG_EditCommand=
MG_FoldTarget=0
MG_MaxLength=7
MG_Triggers=RB
MG_SubTriggers=LB


Goto,MG_RB_End

MG_RB_Enable:
	Hotkey,*RButton,MG_RB_DownHotkey,On
	Hotkey,*RButton up,MG_RB_UpHotkey,On
return

MG_RB_Disable:
	Hotkey,*RButton,MG_RB_DownHotkey,Off
	Hotkey,*RButton up,MG_RB_UpHotkey,Off
return

MG_RB_DownHotkey:
	MG_TriggerDown("RB")
return

MG_RB_UpHotkey:
	MG_TriggerUp("RB")
return

MG_RB_Down:
	SetMouseDelay,-1
	Send,{Blind}{RButton Down}
return

MG_RB_Up:
	SetMouseDelay,-1
	Send,{Blind}{RButton Up}
return

MG_RB_Check:
	if (!GetKeyState("RButton", "P")) {
		MG_UnpressCntRB++
		if (MG_UnpressCntRB > 3) {
			MG_TriggerUp("RB")
			SetMouseDelay,-1
			Send,{Blind}{RButton}
		}
	} else {
		MG_UnpressCntRB := 0
	}
return

MG_RB_End:


Goto,MG_LB_End

MG_LB_Enable:
	Hotkey,*LButton,MG_LB_DownHotkey,On
	Hotkey,*LButton up,MG_LB_UpHotkey,On
return

MG_LB_Disable:
	Hotkey,*LButton,MG_LB_DownHotkey,Off
	Hotkey,*LButton up,MG_LB_UpHotkey,Off
return

MG_LB_DownHotkey:
	MG_TriggerDown("LB")
return

MG_LB_UpHotkey:
	MG_TriggerUp("LB")
return

MG_LB_Down:
	SetMouseDelay,-1
	Send,{Blind}{LButton Down}
return

MG_LB_Up:
	SetMouseDelay,-1
	Send,{Blind}{LButton Up}
return

MG_LB_Check:
	if (!GetKeyState("LButton", "P")) {
		MG_UnpressCntLB++
		if (MG_UnpressCntLB > 3) {
			MG_TriggerUp("LB")
			SetMouseDelay,-1
			Send,{Blind}{LButton}
		}
	} else {
		MG_UnpressCntLB := 0
	}
return

MG_LB_End:


Goto,MG_Config_End


MG_IsDisable(){
	global
	return ((MG_Exe="chrome.exe"))
}

MG_IsTarget1(){
	global
	return ((MG_WClass="CabinetWClass") || (MG_WClass="ExploreWClass") || (MG_WClass="Progman") || (MG_WClass="WorkerW"))
}

MG_IsTarget2(){
	global
	return (MG_IsTarget1() && ((MG_TreeListHitTest())))
}

MG_IsTarget3(){
	global
	return ((MG_Exe="atom.exe"))
}

MG_Gesture_RB_LB__:
	
return

MG_GetAction_RB_LB__:
	
return

MG_Gesture_RB_L_:
	
return

MG_GetAction_RB_L_:
	
return

MG_Gesture_RB_R_:
	
return

MG_GetAction_RB_R_:
	
return

MG_Gesture_RB_U_:
	
return

MG_GetAction_RB_U_:
	
return

MG_Gesture_RB_D_:
	
return

MG_GetAction_RB_D_:
	
return

MG_Gesture_RB_LU_:
	if(MG_IsTarget3()){
		Send,^+{t}
	}else{
		MG_Cancel()
	}
return

MG_GetAction_RB_LU_:
	if(MG_IsTarget3()){
		MG_ActionStr := "Send,^+{t}"
	}else{
		MG_ActionStr := ""
	}
return

MG_Gesture_RB_LD_:
	
return

MG_GetAction_RB_LD_:
	
return

MG_Gesture_RB_RU_:
	
return

MG_GetAction_RB_RU_:
	
return

MG_Gesture_RB_RD_:
	
return

MG_GetAction_RB_RD_:
	
return

MG_Gesture_RB_UL_:
	
return

MG_GetAction_RB_UL_:
	
return

MG_Gesture_RB_UR_:
	
return

MG_GetAction_RB_UR_:
	
return

MG_Gesture_RB_DL_:
	
return

MG_GetAction_RB_DL_:
	
return

MG_Gesture_RB_DR_:
	if(MG_IsTarget3()){
		Send,^{w}
	}else{
		MG_Cancel()
	}
return

MG_GetAction_RB_DR_:
	if(MG_IsTarget3()){
		MG_ActionStr := "Send,^{w}"
	}else{
		MG_ActionStr := ""
	}
return


MG_Config_end: