# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aleon-ca <aleon-ca@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/04 05:28:19 by aleon-ca          #+#    #+#              #
#    Updated: 2020/08/04 05:54:46 by aleon-ca         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SRCS = ft_strlen.s
OBJS = ${SRCS:.s=.o}

NAME = libasm.a
LIB_FLAGS = -L. -lasm
GCC = gcc -Werror -Wextra -Wall
RM = rm -f

$(NAME):
	nasm -fmacho64 ${SRCS}
	ar rc ${NAME} ${OBJS}

all:
	nasm -fmacho64 ${SRCS}
	ar rc ${NAME} ${OBJS}
	${GCC} ${LIB_FLAGS} tester.c
clean:
	${RM} ${OBJS}
fclean:	clean
	${RM} ${NAME} a.out
re:	fclean all

