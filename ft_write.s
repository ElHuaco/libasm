; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: alejandroleon <aleon-ca@student.42.fr      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/05 04:47:58 by alejandro         #+#    #+#              ;
;    Updated: 2020/08/05 04:47:58 by alejandro        ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
; 1st function parameter: rdi -> fd
; 2nd function parameter: rsi -> buff
; 3rd function parameter: rdx -> n_bytes
;label			instruction			operands		comment
			section				.text
			global				_ft_write
			extern				___error
_ft_write:
			cmp				rdi, 0			;Check if buff is (null),
			je				_null_return		; return -1 (error) in that case.
			push				rsi			;Save params before fstat syscall.
			push				rdx
			mov				rax, 0x20000BD		;Call fstat(fd, buff).
			syscall
			pop				rdx			;Put back original rdx, rsi.
			pop				rsi
			jc				_syscallerror_return	;If syscall error, carry flag is set.
			mov				rax, 0x2000004		;Otherwise call write.
			syscall
			jc				_syscallerror_return	;If syscall error, carry flag is set.
			ret							;Otherwise we are finished correctly.
_null_return:
			mov				rax, -1
			ret
_syscallerror_return:
			push				rdi
			mov				rdi, rax		;Save errno in rdi.
			call				___error		;rax points now to errno.
			mov				[rax], rdi
			pop				rdi
			jmp				_null_return
			
