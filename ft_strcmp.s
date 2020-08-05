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
		push			rcx
		push			rdx
		push			r8
		and			rdi, rsi				;if either s1 or s2 is (null), return 0
		jz			_null_return
		mov			rcx, -1
		jmp			_start_loop				;otherwise start comparing string characters
_start_loop:
		inc			rcx
		mov			dl, byte[rdi + rcx]			;move s1[i] to dl
		mov			r8b, byte[rsi + rcx]			;move s2[i] to r8b
		cmp			dl, r8b
		je			_are_equal
		sub			dl, r8b					;if not equal, subtract s1[i] - s2[i]
		cmp			dl, 0
		jg			_is_greater				;if s1[i] - s2[i] > 0, return 1
		jl			_is_smaller				;if s1[i] - s2[i] < 0, return -1
_null_return:
		pop			r8
		pop			rdx
		pop			rcx
		mov			rax, 0
		ret
_are_equal:
		cmp			dl, 0					;if they are equal and 0, return 0
		je			_null_return
		jmp			_start_loop				;otherwise start again
_is_greater:
		mov			rax, 1
		jmp			_return
_is_smaller:
		mov			rax, -1
		jmp			_return
_return:
		pop			r8
		pop			rdx
		pop			rcx
		ret
		
