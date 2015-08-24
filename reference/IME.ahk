/*----------------------------------------------------------------------------
  IME ����p Functuion (�R�s�y�p)
   ����m�F��  2005/09/12
     WinNT4 SP6 / WinXP SP2 (98�n�ł������炭��OK)

    IME_Func.ahk ����悭�g�� IME��Ԏ擾/�Z�b�g���̂ݒ��o
    �e�֐��ԂɈˑ��֌W�͂���܂���B
    �֐��Ԃ̈ˑ��֌W�͖����̂�
    �K�v�Ȋ֐��P�̂�

    2008.07.11 v1.0.47�ȍ~�� �֐����C�u�����X�N���v�g�Ή��p�Ƀt�@�C�������C��
-----------------------------------------------------------------------------
*/


IME_GET(WinTitle="")
;-----------------------------------------------------------
; IME�̏�Ԃ̎擾
;    �ΏہF AHK v1.0.34�ȍ~
;   WinTitle : �Ώ�Window (�ȗ���:�A�N�e�B�u�E�B���h�E)
;   �߂�l  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_GETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x005,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

IME_SET(setSts, WinTitle="")
;-----------------------------------------------------------
; IME�̏�Ԃ��Z�b�g
;    �ΏہF AHK v1.0.34�ȍ~
;   SetSts  : 1:ON 0:OFF
;   WinTitle: �Ώ�Window (�ȗ���:�A�N�e�B�u�E�B���h�E)
;   �߂�l  1:ON 0:OFF
;-----------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_SETOPENSTATUS
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x006,setSts,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

;===========================================================================
; IME ���̓��[�h �擾 / �Z�b�g
;
;    0000xxxx    ���ȓ���
;    0001xxxx    ���[�}������
;    xxxx0xxx    ���p
;    xxxx1xxx    �S�p
;    xxxxx000    �p��
;    xxxxx001    �Ђ炪��
;    xxxxx011    ��/�J�i
;
;     0 (0x00  0000 0000) ����    ���p��
;     3 (0x03  0000 0011)         ����
;     8 (0x08  0000 1000)         �S�p��
;     9 (0x09  0000 1001)         �Ђ炪��
;    11 (0x0B  0000 1011)         �S�J�^�J�i
;    16 (0x10  0001 0000) ���[�}�����p��
;    19 (0x13  0001 0011)         ����
;    24 (0x18  0001 1000)         �S�p��
;    25 (0x19  0001 1001)         �Ђ炪��
;    27 (0x1B  0001 1011)         �S�J�^�J�i

IME_GetConvMode(WinTitle="")
;-------------------------------------------------------
; IME ���̓��[�h�擾
;   in  WinTitle    (�ȗ����A�N�e�B�u�E�B���h�E)
;   �߂�l:  ���̓��[�h
;--------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_GETCONVERSIONMODE
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x001,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

IME_SetConvMode(ConvMode,WinTitle="")
;-------------------------------------------------------
; IME ���̓��[�h�Z�b�g
;   in  ConvMode    ���̓��[�h
;       WinTitle    (�ȗ����A�N�e�B�u�E�B���h�E)
;--------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_SETCONVERSIONMODE
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x002,ConvMode,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

;===========================================================================
; IME �ϊ����[�h
;    0:���ϊ�
;    1:�l��/�n��
;    8:���
;   16:�b�����t�D��

IME_GetSentenceMode(WinTitle="")
;-------------------------------------------------------
; IME �ϊ����[�h�擾
;   in  WinTitle    (�ȗ����A�N�e�B�u�E�B���h�E)
;   �߂�l:  0:���ϊ� 1:�l��/�n�� 8:��� 16:�b�����t�D��
;--------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_GETSENTENCEMODE
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x003,0,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}

IME_SetSentenceMode(SentenceMode,WinTitle="")
;-------------------------------------------------------
; IME �ϊ����[�h�Z�b�g
;   in  SentenceMode 0:���ϊ� 1:�l��/�n�� 8:��� 16:�b�����t�D��
;       WinTitle     (�ȗ����A�N�e�B�u�E�B���h�E)
;--------------------------------------------------------
{
    ifEqual WinTitle,,  SetEnv,WinTitle,A
    WinGet,hWnd,ID,%WinTitle%
    DefaultIMEWnd := DllCall("imm32\ImmGetDefaultIMEWnd", Uint,hWnd, Uint)

    ;Message : WM_IME_CONTROL  wParam:IMC_SETSENTENCEMODE
    DetectSave := A_DetectHiddenWindows
    DetectHiddenWindows,ON
    SendMessage 0x283, 0x004,SentenceMode,,ahk_id %DefaultIMEWnd%
    DetectHiddenWindows,%DetectSave%
    Return ErrorLevel
}
