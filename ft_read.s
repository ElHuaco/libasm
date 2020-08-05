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
_ft_read:
			cmp				rsi, 0			;If buff is (null),
			je				_error_return		; return (-1) and end.
			push				rsi			;Save params before fstat call
			push				rdx
			mov				rax, 0x20000BD		;fstat call
			syscall
			pop				rdx			;Restore params
			pop				rsi
			cmp				rax, 9			;Check that no EBADF happened
			je				_error_return
			mov				rax, 0x2000003		;read call
			syscall
			ret
_error_return:
			mov				rax, -1
			ret
