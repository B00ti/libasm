NAME	=	libasm.so

CC	=	ld

ASM =	nasm


SRC	=	src/strlen.asm	\
		src/strchr.asm	\
		src/memset.asm	\
		src/memcpy.asm	\
		src/strcmp.asm	\
		src/strcasecmp.asm\
		src/memmove.asm	\
		src/rindex.asm	\
		src/strstr.asm	\
		src/strpbrk.asm	\
		src/strcspn.asm	\
		src/strncmp.asm

OBJ =	$(SRC:.asm=.o)

CFLAGS	=	-shared -fpic

ASMFLAGS =	-f elf64

%.o: %.asm
		$(ASM) -o $@ $< $(ASMFLAGS)

all:	$(OBJ)
		$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

clean:
		rm -f src/*.o

fclean:	clean
		rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean re
