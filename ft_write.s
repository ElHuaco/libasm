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
_ft_write:
			cmp				rdi, 0			;Check if buff is (null),
			je				_error_return		; return -1 (error) in that case.
			push				rsi			;Save params before fstat syscall.
			push				rdx
			mov				rax, 0x20000BD		;Call fstat(fd, buff).
			syscall
			pop				rdx			;Put back original rdx, rsi.
			pop				rsi
			cmp				rax, 9			;If errno 9 (EBADF) after fstat, rax=9,
			je				_error_return		; return -1 (error) in that case.
			mov				rax, 0x2000004		;Otherwise call write.
			syscall
			ret
_error_return:
			mov				rax, -1
			ret
