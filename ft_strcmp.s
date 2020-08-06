; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: alejandroleon <aleon-ca@student.42.fr      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/04 12:19:40 by alejandro         #+#    #+#              ;
;    Updated: 2020/08/04 12:19:40 by alejandro        ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
; 1st function parameter: rdi -> s1
; 2nd function parameter: rsi -> s2
; local counter: rcx -> i
; local char variable: dl
;label		instruction		operands				comment

		section			.text
		global			_ft_strcmp
_ft_strcmp:
		cmp			rdi, 0					;If either s1 or s2 is (null), return 0.
		je			_null_return
		cmp			rsi, 0
		je			_null_return
		mov			rcx, 0
		jmp			_start_loop				;Otherwise start comparing string characters.
_start_loop:
		mov			dl, byte[rdi + rcx]			;dl = s1[i].
		cmp			dl, byte[rsi + rcx]			;Compare s2[i] with s1[i]
		jnbe			_is_greater				;If s2[i] > s1[i], return 1.
		jb			_is_smaller				;If s2[i] < s1[i], return -1.
		je			_are_equal				;If s1[i] == s2[i], check if the string ended.
_null_return:
		mov			rax, 0
		ret
_are_equal:
		cmp			dl, 0					;If they are equal and '\0', the strings are
		je			_null_return				; the same, return 0.
		inc			rcx
		jmp			_start_loop				;Otherwise start again.
_is_greater:
		mov			rax, 1
		ret
_is_smaller:
		mov			rax, -1
		ret
