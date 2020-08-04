; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: aleon-ca <aleon-ca@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/04 04:59:24 by aleon-ca          #+#    #+#              ;
;    Updated: 2020/08/04 04:59:46 by aleon-ca         ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
; label		instruction	operands		comment

		global		 _ft_strlen
		section		.text
_ft_strlen:
		mov		rax, 0			;rax always return value. Here also counter. Set to 0.
_start_loop:
		cmp		byte [rdi + rax], 0	;comp with 0 byte at rdi (1st function parameter) + rax.
		je		_end_loop		;if byte was 0, we have finished, end the loop.
		inc		rax			;otherwise increase the counte.
		jmp		_start_loop		;start the loop again.
_end_loop:
		ret					;return rax value
