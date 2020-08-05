; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: alejandroleon <aleon-ca@student.42.fr      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/05 06:05:13 by alejandro         #+#    #+#              ;
;    Updated: 2020/08/05 06:05:13 by alejandro        ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
; 1st function parameter: rdi -> fd
; 2nd function parameter: rsi -> buff
; 3rd function parameter: rdx -> n_bytes
;label			interactions			operands		comment
			section				.text
			global				_ft_read
			extern				___error
_ft_read:
			cmp				rsi, 0			;If buff is (null),
			je				_null_return		; return (-1) and end.
			push				rsi			;Save params before fstat call
			push				rdx
			mov				rax, 0x20000BD		;fstat call
			syscall
			pop				rdx			;Restore params
			pop				rsi
			cmp				rax, 0			;If there was an error during syscall,
			jl				_syscallerror_return	; rax is an Error Code, i.e., less than 0.
			mov				rax, 0x2000003		;Otherwise call read.
			syscall
			cmp				rax, 0			;If there was an error during syscall,
			jl				_syscallerror_return	; rax is an Error Code, i.e., less than 0.
			ret							;Otherwise we are correctly finished.
_null_return:
			mov				rax, -1
			ret
_syscallerror_return:
			push				rdi
			mov				rdi, rax		;Need Error Code in rax as param to error?
			call				___error		;This supposedly sets errno
			pop				rdi
			ret
