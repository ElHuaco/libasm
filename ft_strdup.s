; **************************************************************************** ;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: alejandroleon <aleon-ca@student.42.fr      +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2020/08/05 03:16:51 by alejandro         #+#    #+#              ;
;    Updated: 2020/08/05 03:16:51 by alejandro        ###   ########.fr        ;
;                                                                              ;
; **************************************************************************** ;
; 1st function parameter: rdi -> s1
; local counter: rcx -> i
; local variable pointer: rsi -> dup
;label			instruction			operands		comment
			section				.text
			global				_ft_strdup
			extern				_ft_strlen
			extern				_ft_strcpy
			extern				_malloc
_ft_strdup:
			push				rdi			;Saving rdi before function call.
			cmp				rdi, 0
			je				_null_return		;If s1 (null), return 0.
			call				_ft_strlen		;Now we have strlen(s1) in rax.
			pop				rdi			;Restoring rdi.
			inc				rax			;Need to malloc len+1 for the '\0'.
			push				rdi			;Saving rdi before call and mov.
			mov				rdi, rax		;Need to pass len+1 as param to malloc.
			call				_malloc			;Malloc(len+1).
			cmp				rax, 0			;If error, rax is 0 now.
			je				_null_return		;In that case, return 0 and end.
			pop				rdi			;Otherwise s1 in rdi and dup in rax
			push				rsi			;Saving rsi before ft_strcpy call.
			mov				rsi, rdi		;src is 2nd param in ft_strcpy
			mov				rdi, rax		;dst is 1st param in ft_strcpy
			call				_ft_strcpy		;ft_strcpy(rdi=dup, rsi=s1); Now dup in rax.
			pop				rsi
			ret
_null_return:
			pop				rdi
			mov				rax, 0
			ret
			
