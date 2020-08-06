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
			mov				rax, 0x2000004		;Call write.
			syscall
			jc				_syscallerror_return	;If syscall error, carry flag is set.
			ret							;Otherwise we are finished correctly.
_null_return:
			mov				rax, -1
			ret
_syscallerror_return:
			push				rdi
			mov				rdi, rax		;rax is Error Code after failed syscall
			call				___error		;rax points now to errno.
			mov				[rax], rdi		;Stores Error Code in errno pointer
			pop				rdi
			jmp				_null_return
			
