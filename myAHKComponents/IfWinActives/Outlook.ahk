#IfWinActive,ahk_class rctrl_renwnd32

	;���̃��[����
	RButton & WheelDown::
		send,^{>}
	return

	;�O�̃��[����
	RButton & WheelUp::
		send,^{<}
	return

	;���[����Done���Ď���
	RButton & LButton::
		send,^+{1}
		sleep,200
		send,{return}
	return

	;���[����Doing���Ď���
	RButton & XButton2::
		send,^+{2}
		sleep,200
		send,{return}
	return

	;���[�������
	RButton & XButton1::
		WinGetTitle, Title, A
		IfInString, Title, Outlook , {
			;Outlook�̃R�A(���[���Ɨ\��\)�ł͖���
		}else{
			Send,!{F4}
		}
	return

	;�i�ށA�߂�
	XButton2::Send,^{y}
	XButton1::Send,^{z}


	;�\��\��ICS�ŕۑ�
	vkEBsc07B & s::
	LControl & s::
		if CAPS() && LCMD(){
			;
			Send,!{f}{c}

			;�A�h���X�o�[�Ƀf�X�N�g�b�v�Ɠ���
			Send,!{d}
			directInput("�f�X�N�g�b�v")
			Send,{return}

			;�\��\�̏ڍדx��ݒ�
			Send,!{m}
			Send,{Tab}
			Send,{Down}

			;�����w�藓�Ɉړ�
			Send,+{Tab}
			Send,{Down}{Down}{Down}{Down}{Down}
		}else
			mbind_s()
	return

	;�\��\��ICS�ŕۑ�(����)
	vkEBsc07B & a::
	LControl & a::
		if CAPS() && LCMD(){
			;
			Send,!{f}{c}

			;�A�h���X�o�[�Ƀf�X�N�g�b�v�Ɠ���
			Send,!{d}
			directInput("�f�X�N�g�b�v")
			Send,{return}

			;�\��\�̏ڍדx��ݒ�
			Send,!{m}
			Send,{Tab}
			Send,{Down}

			;�����w�藓�Ɉړ�
			Send,!{o}
			Send,!{s}
			Send,!{y}
		}else
			mbind_a()
	return

	;�\��\��ICS�ŕۑ�(����)
	vkEBsc07B & d::
	LControl & d::
		if CAPS() && LCMD(){
			;
			Send,!{f}{c}

			;�A�h���X�o�[�Ƀf�X�N�g�b�v�Ɠ���
			Send,!{d}
			directInput("�f�X�N�g�b�v")
			Send,{return}

			;���̑��̃I�v�V����
			Send,!{m}

			;�����̗\��ɐݒ�
			Send,{Down}

			;�\��\�̏ڍדx��ݒ�
			Send,{Tab}
			Send,{Down}

			;�����w�藓�Ɉړ�
			Send,!{o}
			Send,!{s}
			Send,!{y}
		}else
			mbind_d()
	return

#IfWinActive