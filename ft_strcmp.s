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
		push			rcx
		push			rdx
		and			rdi, rsi				;if either s1 or s2 is (null), return immediately
		jz			_null_return
		mov			rcx, -1
		jmp			_start_loop				;otherwise start comparing string characters
_start_loop:
		inc			rcx
		or			byte [rdi + rcx], byte [rsi + rcx]	;if both s1[i] or s2[i] are '\0', return 0
		jz			_null_return
		cmp			byte [rdi + rcx], byte [rsi + rcx]	;otherwise see if they are equal.
		je			_start_loop				;If so, go to the next iteration
		mov			dl, byte[rdi + rcx]			;if not, subtract s1[i] - s2[i]
		sub			dl, byte[rsi + rcx]
		cmp			dl, 0					
		jg			_is_greater				;if s1[i] - s2[i] > 0, return 1
		jmp			_is_smaller				;otherwise return -1
_null_return:
		pop			rdx
		pop			rcx
		mov			rax, 0
		ret
_is_greater:
		mov			rax, 1
		jmp			_return
_is_smaller:
		mov			rax, -1
		jmp			_return
_return:
		pop			rdx
		pop			rcx
		ret
		
