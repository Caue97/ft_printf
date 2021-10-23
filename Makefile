# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: felcaue- <felcaue-@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/23 18:30:16 by felcaue-          #+#    #+#              #
#    Updated: 2021/10/23 19:40:47 by felcaue-         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		= libftprintf.a

CC			= gcc
CFLAGS		= -Wall -Wextra -Werror
LIB			= ar -rcs
RM			= /bin/rm -rf

DIRECTORY	=	Objs_printf

INCLUDE		=	ft_printf.h 
SRCS		=	ft_printf.c \
				$(ADD_ARG) \
				
ARGS		=	argument_c.c argument_d.c argument_i.c \
				argument_p.c argument_s.c argument_u.c \
				argument_x_lower.c argument_x_upper.c \
				
ADD_ARG		=	$(addprefix arguments/,$(ARGS))
				

OBJS		= $(addprefix ./$(DIRECTORY)/,$(SRCS:.c=.o))

all:		$(NAME)

$(DIRECTORY)/%.o:	%.c
					mkdir -p $(@D)
					$(CC) $(CFLAGS) -c $< -o $@

$(NAME):	$(OBJS) $(INCLUDE)
			make -C libft
			cp libft/libft.a $(NAME)
			$(LIB) $(NAME) $(OBJS)

git:
			git add .
			git commit -m "updating norminette v3"
			git push

clean:
			$(RM) $(DIRECTORY)
			make -C libft clean

fclean:		clean
			$(RM) $(NAME)
			make -C libft fclean

re:			fclean all

.PHONY:		all clean fclean re