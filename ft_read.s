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
			push				rsi
			push				rdx
			mov				rax, 0x20000BD		;fstat call
			syscall
			pop				rdx
			pop				rsi
			jc				_syscallerror_return	;If error in syscall, carry flag is set.
			mov				rax, 0x2000003		;Otherwise call read.
			syscall
			jc				_syscallerror_return	;If error in syscall,  carry flag is set.
			ret							;Otherwise we are correctly finished.
_null_return:
			mov				rax, -1
			ret
_syscallerror_return:
			push				rdi
			mov				rdi, rax
			call				___error		;returns rax as address of errno
			mov				[rax], rdi		;Sets errno in the pointer
			pop				rdi
			jmp				_null_return
