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
		cmp			rsi, 0			;Check if src is (null)
		je			return			; return immediately then.
		mov			rcx, 0			;Otherwise start counter.
_start_loop:
		mov			dl, byte [rsi + rcx]	;Put in dl char at rsi + rcx (dl=src[i]).
		mov			byte [rdi + rcx], dl	;Put that char in rdi + rcx (dst[i]=dl).
		cmp			dl, 0			;Check if we put '\0'
		je			return			; we are finished then.
		inc			rcx			;Otherwise increase the counter.
		jmp			_start_loop		;Start the loop again.
return:
		mov			rax, rdi		;Move rdi to rax to return it.
		ret			
