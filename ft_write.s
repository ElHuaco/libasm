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
			push				rsi			;Save params before fstat syscall.
			push				rdx			; and auxiliar save
			cmp				rdi, 0			;Check if buff is (null)
			je				_null_return		; return -1 (error) in that case.
			mov				rax, 0x20000BD		;Call int fstat(fd, buff).
			syscall
			cmp				rax, 9			;Return 9 after fstat is errno 9, EBADF
			je				_null_return
			pop				rdx			;Put back original rdi, rsi.
			pop				rsi
			mov				rax, 0x2000004		;Call write.
			syscall
			ret
_null_return:
			pop				rdx			;Restore local var before exit.
			pop				rsi
			mov				rax, -1
			ret
