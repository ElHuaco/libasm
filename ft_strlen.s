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
; 1st function parameter: rdi -> str
; return register and counter: rax -> i
; label		instruction	operands		comment
		section		.text
		global		 _ft_strlen
_ft_strlen:
		cmp		rdi, 0			;If str is (null), do nothing.
		je		_end_loop
		mov		rax, 0			;rax always return value. Here also counter. Set to 0.
_start_loop:
		cmp		byte [rdi + rax], 0	;Compare with 0 the byte at rdi + rax.
		je		_end_loop		;If byte was 0, we have finished, end the loop.
		inc		rax			;Otherwise increase the counter.
		jmp		_start_loop		;Start the loop again.
_end_loop:
		ret					;return rax value
