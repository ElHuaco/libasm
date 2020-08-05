/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tester.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aleon-ca <aleon-ca@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/04 05:02:04 by aleon-ca          #+#    #+#             */
/*   Updated: 2020/08/05 05:51:08 by alejandro        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

int	main(void)
{
	char	*str;

	str = "Hola carcacola";
	printf("strlen de %s: %lu\t", str, strlen(str));
	printf("ft_strlen de %s: %lu\n", str, ft_strlen(str));
	str = "00000000000000000000000000000000000000000000000000000000000000000";
	printf("strlen de %s: %lu\t", str, strlen(str));
	printf("ft_strlen de %s: %lu\n", str, ft_strlen(str));
	str = "";
	printf("strlen de %s: %lu\t", str, strlen(str));
	printf("ft_strlen de %s: %lu\n", str, ft_strlen(str));
	char	*dst;
	char	*src;

	dst = malloc(sizeof(char) * 2); dst[0] = 'a'; dst[1] = 'b';
	src = malloc(sizeof(char) * 2); src[0] = 'c'; src[1] = 'd';
	printf("strcpy(%s, %s):", dst, src);
	printf("%s\t", strcpy(dst, src));
	free(dst); free(src);
	dst = malloc(sizeof(char) * 2); dst[0] = 'a'; dst[1] = 'b';
	src = malloc(sizeof(char) * 2); src[0] = 'c'; src[1] = 'd';
	printf("ft_strcpy(%s, %s):", dst, src);
	printf(" %s\n", ft_strcpy(dst, src));
	free(dst); free(src);
	
	dst = malloc(sizeof(char) * 2); dst[0] = 'a'; dst[1] = 'b';
	src = malloc(sizeof(char) * 2); src[0] = 0; src[1] = 0;
	printf("strcpy(%s, %s):", dst, src);
	printf(" %s\t", strcpy(dst, src));
	free(src); free(dst);
	dst = malloc(sizeof(char) * 2); dst[0] = 'a'; dst[1] = 'b';
	src = malloc(sizeof(char) * 2); src[0] = 0; src[1] = 0;
	printf("ft_strcpy(%s, %s):", dst, src);
	printf("%s\n", ft_strcpy(dst, src));
	free(src); free(dst);
	
	dst = malloc(sizeof(char) * 1); dst[0] = 1;
	src = malloc(sizeof(char) * 7); for (int i = 0; i < 7; i++){src[i] = i + 48;}
	printf("strcpy(%s, %s):", dst, src);
	printf(" %s\t", strcpy(dst, src));
	free(dst); free(src);
	dst = malloc(sizeof(char) * 1); dst[0] = 1;
	src = malloc(sizeof(char) * 7); for (int i = 0; i < 7; i++){src[i] = i + 48;}
	printf("ft_strcpy(%s, %s):", dst, src);
	printf(" %s\n", ft_strcpy(dst, src));
	free(dst); free(src);

	char	*s1;
	char	*s2;

	s1 = "Hola";
	s2 = "HolA";
	printf("strcmp: %d, ft_strcmp: %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	s2 = "Holaa";
	printf("strcmp: %d, ft_strcmp: %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	s2 = s1;
	printf("strcmp: %d, ft_strcmp: %d\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	
	s1 = malloc(sizeof(char) * 9); s1 = "EYCHAVAL";
	printf("strdup(%s): %s\t", s1, strdup(s1));
	printf("ft_strdup(%s): %s\n", s1, ft_strdup(s1));
	s1 = "";
	printf("strdup(%s): %s\t", s1, strdup(s1));
	printf("ft_strdup(%s): %s\n", s1, ft_strdup(s1));
	s1 = "1234567890909090909990909090909090";
	printf("strdup(%s): %s\t", s1, strdup(s1));
	printf("ft_strdup(%s): %s\n", s1, ft_strdup(s1));
	system("touch write.txt");
	int fd = open("write.txt", O_WRONLY);
	write(fd, "write escribe\n", 14);
	ft_write(fd, "ft_write escribe\n", 17);
	close(fd);
	system("cat write.txt");
	return (0);
}
