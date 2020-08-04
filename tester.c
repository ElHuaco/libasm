/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tester.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: aleon-ca <aleon-ca@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/04 05:02:04 by aleon-ca          #+#    #+#             */
/*   Updated: 2020/08/04 13:19:24 by aleon-ca         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

int	main(void)
{
	char	*str;

	str = "Hola carcacola";
	printf("strlen de %s: %lu\n", str, strlen(str));
	printf("ft_strlen de %s: %lu\n", str, ft_strlen(str));
	str = "00000000000000000000000000000000000000000000000000000000000000000";
	printf("strlen de %s: %lu\n", str, strlen(str));
	printf("ft_strlen de %s: %lu\n", str, ft_strlen(str));
	str = "";
	printf("strlen de %s: %lu\n", str, strlen(str));
	printf("ft_strlen de %s: %lu\n", str, ft_strlen(str));
	char	*dst;
	char	*src;

	dst = malloc(sizeof(char) * 2); dst[0] = 'a'; dst[1] = 'b';
	src = malloc(sizeof(char) * 2); src[0] = 'c'; src[1] = 'd';
	printf("==============\n");
	printf("strcpy(%s, %s): %s\n", dst, src, strcpy(dst, src));
	printf("ft_strcpy(%s, %s): %s\n", dst, src, ft_strcpy(dst, src));
	free(dst); free(src);
	dst = malloc(sizeof(char) * 2); dst[0] = 'a'; dst[1] = 'b';
	src = malloc(sizeof(char) * 2); src[0] = 0; src[1] = 0;
	printf("strcpy(%s, %s): %s\n", dst, src, strcpy(dst, src));
	printf("ft_strcpy(%s, %s): %s\n", dst, src, ft_strcpy(dst, src));
	free(src); free(dst);
	char	*s1;
	char	*s2;

	s1 = "Hola";
	s2 = "HolA";
	printf("strcmp: %s, ft_strcmp: %s\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	s2 = "Holaa";
	printf("strcmp: %s, ft_strcmp: %s\n", strcmp(s1, s2), ft_strcmp(s1, s2));
	return (0);
}
