# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aleon-ca <aleon-ca@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/04 05:28:19 by aleon-ca          #+#    #+#              #
#    Updated: 2020/09/15 09:03:40 by aleon-ca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_strdup.s ft_write.s ft_read.s
OBJS = ${SRCS:.s=.o}

NAME = libasm.a

LIB_FLAGS = -L. -lasm
GCC = gcc -Werror -Wextra -Wall
COMPILE = ar rc ${NAME} ${OBJS}

RM = rm -f

.s.o:
	nasm -f macho64 $< -o ${<:.s=.o}

$(NAME):	${OBJS}
	${COMPILE}

test:
	${GCC} ${LIB_FLAGS} tester.c
	clear && ./a.out

all:		${NAME}

clean:
	${RM} ${OBJS}

fclean:	clean
	${RM} ${NAME}

re:	fclean all

