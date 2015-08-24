;
; Redirect Scrool Function  �X�N���[������
;   �E�����Ή�
;   �EWord / Excel / VBE / �G�ۓ��̕����y�C�����݊��X�N���[���ő���\
;
;   �P�� / �g���ݗ��Ή�  2008/05/25 (AutoHotkey 1.0.47.06)
;   �g���ݎ� 
;     #Include WheelScroll.ahk
;     Gosub,WheelInit             ;������ :AutoExecute�Z�N�V�����ɋL�q
;---------------------------------------------------------------------------

;+++++++++++++++++++++++++++++++++++++++++++++++++++++++
;   �P�̋N���p
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++
#NoEnv                  ; �ϐ��������߂���Ƃ��A���ϐ��𖳎�����
#SingleInstance FORCE   ; �����v���Z�X�Ŏ��s�̋֎~
#WinActivateForce       ; �^�X�N�o�[�A�C�R���_�Ŗh�~
#MaxHotkeysPerInterval 80 ;�L�[���s�[�g�G���[�h�~�p

WheelAutoExecute:
    SendMode Input              ; ���M���Ƀ��[�U�[�������񂵂ɂ���B
    Gosub,WheelInit
    Hotkey,^ESC, WheelExit     ;�I���F [Ctrl]+[ESC]
return
WheelExit:
    exitapp
return


;+++++++++++++++++++++++++++++++++++++++++++++++++++++++
;   �P��/�g���ݗ��p
;+++++++++++++++++++++++++++++++++++++++++++++++++++++++
WheelInit:
;-------------------------------------------------------
;   ������
;-------------------------------------------------------
    ;--- �I�v�V���� ---
    DefaultScrollMode = 0           ;��{���샂�[�h  0:WHELL 1:�݊�SCROLL
    AcclSpeed         = 1           ;�������̔{��(0�ŉ���OFF)
    AcclTOut          = 300         ;�����^�C���A�E�g�l(ms)
    ScrlCount         = 2           ;�݊��X�N���[���s��

    ;�z�C�[���œ������R���g���[���̃N���X���X�g
    MouseWhellList =MozillaWindowClass

    ;�݊����[�h�œ������R���g���[���̃N���X���X�g
    VScroolList =  MdiClient            ;MDI�e (MS-Access�Ȃ�)
                  ,VbaWindow            ;VisualBasicEditor
                  ,_WwB                 ;MS-Word(�ҏW�̈�S��)
                  ,Excel7               ;MS-Excel
;;;;;                  ,OModule                ;MS-Access97   2008.05.20

    ;MDI���O�A�N�e�B�u�����X�g (��è�ގq����޳�̂��ް��������؂Ȃ�)
    MdiActivateList = Excel7            ;MS-Excel

    ;--- �݊����[�h �J�X�^������ ---
    ;�������X�g(�o�C�p�X���Đe�R���g���[���𐧌䂷��)
    BypassCtlList =   ScrollBar         ;�X�N���[���o�[�{��
                    , _WwG              ;MS-Word�����y�C��(����_WwB�Ő���)

    ;�Z��X�N���[���o�[ : ��۰��ް���z���ł͂Ȃ�����ɂ������
    BrotherScroolBarList = TkfInnerView.UnicodeClass    ;�G�f�B�^

    ;�֎~���X�g�F��۰�����ق����Ȃ����́A�݊����[�h���g�p���Ȃ�
    NullShwndTabooList = Excel7         ;MS-Excel(�N���b�V���΍�)


    ;---- ���X�N���[�� �J�X�^������ ---
    ;���X�N���[�����O���X�g
    HDisavledList = 

return

;==============================================
;     Hotkeys
;==============================================
WheelDown::     WheelRedirect()
WheelUp::       WheelRedirect()

;Shift�z�C�[���ŉ��X�N���[��
+WheelDown::    WheelRedirect(1)
+WheelUp::      WheelRedirect(1)

/* ���������� Logicool�}�E�X�p �ݒ�T���v�� ����������������������������

;Logicool�}�E�X�`���g1(uberOptions�� ��:F13 �E:F14�����蓖�Ă��Ă���Ɖ���)
; �����������������͐��������Ȃ��̂�user.xml���蓮�ɂĕҏW��
; �L�[���s�[�g�𔭐�������K�v����
F13::   WheelRedirect(1,0)
F14::   WheelRedirect(1,1)

;Logicool�}�E�X�`���g2(SetPoint�� ��:F11 �E:F12�Ɋ��蓖�Ă��Ă���Ɖ���)
F11::       SetTimer,TiltRepeatL,80
F11 up::    SetTimer,TiltRepeatL,OFF
F12::       SetTimer,TiltRepeatR,80
F12 up::    SetTimer,TiltRepeatR,OFF
TiltRepeatL:
    WheelRedirect(1,0)
return
TiltRepeatR:
    WheelRedirect(1,1)
return
;������������������������������������������������������������������������
*/

;

;==============================================
;     Functions
;==============================================
WheelRedirect(mode=0,dir="")
;-------------------------------------------------------------
;   �z�C�[�����_�C���N�g
;   mode 0:�c�X�N���[��  1:���X�N���[�� (�ȗ���:�c)
;   dir  0:UP(LEFT)      1:DOWN(RIGHT)  (�ȗ���:�z�C�[������)
;-------------------------------------------------------------
{
    global  DefaultScrollMode, AcclSpeed, AcclTOut, ScrlCount
           ,MouseWhellList, VScroolList, MdiActivateList
           ,BypassCtlList, NullShwndTabooList, HDisavledList

    CoordMode,Mouse,Screen
    MouseGetPos,mx,my,hwnd,ctrl,3
    WinGetClass,wcls, ahk_id %hwnd%
    SendMessage,0x84,0,% (my<<16)|mx,,ahk_id %ctrl% ;WM_NCHITTEST
    If (ErrorLevel = 0xFFFFFFFF)
        MouseGetPos,,,,ctrl,2
    ifEqual,ctrl,,  SetEnv,ctrl,%hwnd%              ;2008.05.25
    WinGetClass,ccls,ahk_id %ctrl%

    ;�������X�g�`�F�b�N�F1�K�w��̃R���g���[���𐧌�ΏۂƂ���
    ifInString, BypassCtlList, %ccls%
    {
        ctrl := DllCall("GetParent",UInt,ctrl, UInt)
        WinGetClass,ccls,ahk_id %ctrl%
    }

    ;MDI���O�A�N�e�B�u�����X�g�`�F�b�N : ��è�ގq����޳��è�މ�
    if ccls in %MdiActivateList%
    {
        MdiClient := DllCall("GetParent",UInt,ctrl, UInt)
        SendMessage, 0x229, 0,0,,ahk_id %MdiClient% ;WM_MDIGETACTIVE
        if (ctrl != ErrorLevel) {
            if(ccls = "Excel7")     {               ;Excel�J�X�^��
                WinActivate, ahk_id %hwnd%
                MouseClick,Left
            }
            Else    PostMessage,0x222, %ctrl%,0,,ahk_id %MdiClient%
        }
    }
    scnt := GetScrollBarHwnd(shwnd,mx,my,ctrl,mode) ;��۰�����َ擾

    ;�X�N���[������w��
    scmode := DefaultScrollMode<<1 | mode
    if ccls in %HDisavledList%          ;���X�N���[���֎~
        scmode &= 0x10
    if ccls in %MouseWhellList%         ;�z�C�[�����[�h
        scmode &= 0x01
    if ccls in %VScroolList%            ;�݊����[�h
        scmode |= 0x10
    if (!shwnd) {                       ;�݊����[�h�֎~���X�g
        if ccls in %NullShwndTabooList%
            scmode  = 0
    }

    if (!scmode)
            MOUSEWHELL(ctrl,mx,my,dir,AcclSpeed,AcclTOut)
    Else    SCROLL(ctrl,mode,shwnd,dir,ScrlCount,AcclSpeed,AcclTOut)
}

GetScrollBarHwnd(byref shwnd, mx,my,Cntlhwnd,mode=0)
;----------------------------------------------------------------------------
; �Y���R���g���[���̃X�N���[���n���h����Ԃ�
;   �߂�l �w������̃X�N���[���I�u�W�F�N�g��
;   out    shwnd       �X�N���[���n���h���i�[��
;   in     mx,my       �}�E�X�ʒu
;          Cntlhwnd    �ΏۃR���g���[���̃n���h��
;          mode        0:VSCROLL(�c) 1:HSCROLL(��)
;----------------------------------------------------------------------------
{
    global BrotherScroolBarList

    shwnd = 0
    WinGet,lst,ControlList,ahk_id %Cntlhwnd%
    WinGetClass,pcls, ahk_id %Cntlhwnd%

    ;�z���ɃX�N���[���o�[�Ȃ�
    ifNotInString, lst, ScrollBar
    {   ;�Z��w�肪����ꍇ�́A�����Ɠ���̃X�N���[���o�[��T��
        if pcls in %BrotherScroolBarList%
        {
            Cntlhwnd := DllCall("GetParent",UInt,Cntlhwnd, UInt)
            WinGet,lst,ControlList,ahk_id %Cntlhwnd%
            WinGetClass,pcls, ahk_id %Cntlhwnd%
        }
        else return 0
    }

    ;�X�N���[���o�[�R���g���[���̒��o
    vcnt = 0
    hcnt = 0
    Loop,Parse,lst,`n
    {
        ifNotInstring A_LoopField , ScrollBar
            Continue
        ControlGet,hwnd, Hwnd,,%A_LoopField%,ahk_id %Cntlhwnd%
        WinGetpos, sx,sy,sw,sh, ahk_id %hwnd%

        if (sw < sh)    {   ;�c�X�N���[��
            vcnt++
            WinGetpos, vx%vcnt%,vy%vcnt%,vw%vcnt%,vh%vcnt%, ahk_id %hwnd%
            if (vi = "")
            || ((vy%vi%!=sy)&&((sy<my)&&(vy%vi%<sy))||((vy%vi%>my)&&(vy%vi%>sy))) ;�㉺����
            || ((vx%vi%!=sx)&&((sx>mx)&&(vx%vi%>sx))||((vx%vi%<mx)&&(vx%vi%<sx))) ;���E����
            {
                vi := vcnt
                if (mode = 0)   {
                    ret   := vcnt
                    shwnd := hwnd
                }
            }
        }
        if (sw > sh)    {   ;���X�N���[��
            hcnt++
            WinGetpos, hx%hcnt%,hy%hcnt%,hw%hcnt%,hh%hcnt%, ahk_id %hwnd%
            if (hi = "")
            || ((hx%hi%!=sx)&&((sx<mx)&&(hx%hi%<sx))||((hx%hi%>mx)&&(hx%hi%>sx)))           ;���E(Excel�^)
            || ((hy%hi%!=sy)&&((sy+sh>my)&&(hy%hi%>sy))||((hy%hi%+hh%hi%<my)&&(hy%hi%<sy))) ;�㉺(Word�^)
            {
                hi := hcnt
                if (mode = 1)   {
                    ret   := hcnt
                    shwnd := hwnd
                }
            }
        }
    }

    ;---�A�N�e�B�u�y�C���ɂ����o�[���Ȃ��A�v���A�\�Ȃ�y�C����؂�ւ���---
    ;[�G��]�p �J�X�^���F�����E�B���h�E�؂�ւ�
    if (pcls = "HM32CLIENT") && !((vy1 <= my) && (vy1+vh1 >= my))
        PostMessage, 0x111, 142,  0, ,ahk_id %Cntlhwnd%   ;WM_COMMAND
    ;------------------------------------------------------------------------

    return ret
}

;------ PostMessage Scrool Control ------------------------------------------

MOUSEWHELL(hwnd,mx,my,dir="", ASpeed=1,ATOut=300)
;----------------------------------------------------------------------------
; WM_MOUSEWHELL�ɂ��C�ӃR���g���[���X�N���[��
;       hwnd        �Y���R���g���[���̃E�B���h�E�n���h��
;       mx,my       �}�E�X�ʒu
;       dir         �O����� 0:UP 1:DOWN
;
;       ASpeed       :�������̔{��(0�ŉ���OFF)
;       ATOut        :�����^�C���A�E�g�l(ms)
;----------------------------------------------------------------------------
{
    static delta

    ;�z�C�[������
    If (A_PriorHotkey <> A_ThisHotkey) || (ATOut < A_TimeSincePriorHotkey) 
       || (0 >= ASpeed)
        delta = 120
    Else If (delta < 1000)
        delta += 120 * ASpeed

    ; wParam: Delta(�ړ���)
    wpalam  :=GetKeyState("LButton")     | GetKeyState("RButton") <<1 
            | GetKeyState("Shift")   <<2 | GetKeyState("Ctrl")    <<3 
            | GetKeyState("MButton") <<4 | GetKeyState("XButton1")<<5
            | GetKeyState("XButton2")<<6

    If (dir = 0)
         wpalam |=   delta << 16        ;up
    Else if (dir = 1)
         wpalam |= -(delta << 16)       ;down
    Else ifInstring A_ThisHotkey, WheelUp
         wpalam |=   delta << 16        ;up
    Else wpalam |= -(delta << 16)       ;down

    ; lParam: XY���W
    lpalam := (my << 16) | mx

    ;WM_MOUSEWHELL
    PostMessage, 0x20A, %wpalam%, %lpalam%, , ahk_id %hwnd%
}

SCROLL(hwnd,mode=0,shwnd=0,dir="", ScrlCnt=1,ASpeed=1,ATOut=300)
;----------------------------------------------------------
; WM_SCROLL�ɂ��C�ӃR���g���[���X�N���[��
;       hwnd        �Y���R���g���[���̃E�B���h�E�n���h��
;       mode        0:VSCROLL(�c) 1:HSCROLL(��)
;       shwnd       �X�N���[���o�[�̃n���h��
;       dir         �O����� 0:SB_LINEUP/LEFT 1:SB_LINEDOWN/RIGHT
;
;       ScrlCnt      :�X�N���[���s��
;       ASpeed       :�������̔{��(0�ŉ���OFF)
;       ATOut        :�����^�C���A�E�g�l(ms)
;----------------------------------------------------------
{
    static ACount

    ;����
    If (A_PriorHotkey <> A_ThisHotkey) || (ATOut < A_TimeSincePriorHotkey) 
       || (0 >= ASpeed)
        ACount := ScrlCnt
    Else
        ACount += ScrlCnt * ASpeed

    ;wParam: ����
    if (dir = "")
    {
        ifInstring A_ThisHotkey, WheelUp
             dir = 0                        ;SB_LINEUP   / SB_LINELEFT
        Else dir = 1                        ;SB_LINEDOWN / SB_LINERIGHT
    }
    
    ;0x114:WM_HSCROLL  0x115:WM_VSCROLL
    msg := 0x115 - mode

    Loop, %ACount%
        PostMessage, %msg%, %dir%, %shwnd%, , ahk_id %hwnd%
    PostMessage, %msg%, 8, %shwnd%, , ahk_id %hwnd% ;SB_ENDSCROLL
}

