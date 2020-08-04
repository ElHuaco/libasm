; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aleon-ca <aleon-ca@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/04 06:14:39 by aleon-ca          #+#    #+#              ;
;    Updated: 2020/08/04 06:14:39 by aleon-ca         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
; 1st function parameter: rdi -> dst
; 2nd function parameter: rsi -> src
; local variable: rdx, but only need 1 byte to store char: dl -> src[i]
; local counter: rcx -> i

;label		instruction		operands		comment
		section			.text
		global			_ft_strcpy
_ft_strcpy:
		push			rdx			;64 bit x86 C Calling Convention
		push			rcx			;idem
		cmp			rsi, 0			;check if src is (null)
		je			return			;return immediately then
		mov			rcx, 0			;otherwise start counter
_start_loop:
		mov			dl, byte [rsi + rcx]	;store in dl char at rsi + rcx (src[i])
		mov			byte [rdi + rcx], dl	;put that char in rdi + rcx (dst[i])
		cmp			dl, 0			;check if we stored '\0'
		je			return			;we are finished then
		inc			rcx			;otherwise increase the counter
		jmp			_start_loop		;start the loop again
return:
		mov			rax, rdi		;move rdi to rax to return it
		pop			rcx			;Deallocate in reverse order convention
		pop			rdx
		ret			
