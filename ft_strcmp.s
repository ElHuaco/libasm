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
; local char variable 2: r8b
;label		instruction		operands				comment

		section			.text
		global			_ft_strcmp
_ft_strcmp:
		and			rdi, rsi				;If either s1 or s2 is (null), return 0.
		jz			_null_return
		mov			rcx, -1
		jmp			_start_loop				;Otherwise start comparing string characters.
_start_loop:
		inc			rcx
		mov			dl, byte[rdi + rcx]			;dl = s1[i].
		mov			r8b, byte[rsi + rcx]			;r8b = s2[i].
		cmp			dl, r8b					;If s1[i] == s2[i], check if the string ended.
		je			_are_equal
		sub			dl, r8b					;Otherwise, subtract s1[i] - s2[i].
		cmp			dl, 0
		jg			_is_greater				;If s1[i] - s2[i] > 0, return 1.
		jl			_is_smaller				;If s1[i] - s2[i] < 0, return -1.
_null_return:
		mov			rax, 0
		ret
_are_equal:
		cmp			dl, 0					;If they are equal and '\0', the strings are
		je			_null_return				; the same, return 0.
		jmp			_start_loop				;Otherwise start again.
_is_greater:
		mov			rax, 1
		ret
_is_smaller:
		mov			rax, -1
		ret
