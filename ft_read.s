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
			mov				rax, 0x2000003		;Call read.
			syscall
			jc				_syscallerror_return	;If error in syscall, carry flag is set.
			ret							;Otherwise we are correctly finished.
_null_return:
			mov				rax, -1
			ret
_syscallerror_return:
			push				rdi
			mov				rdi, rax		;rax is Error Code after failed syscall
			call				___error		;returns rax as address of errno
			mov				[rax], rdi		;Sets Error Code in the errno pointer
			pop				rdi
			jmp				_null_return
