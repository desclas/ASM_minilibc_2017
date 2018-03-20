NAME	=	libasm.so

all: $(NAME)

$(NAME):
	@nasm -f elf64 strlen.asm
	@nasm -f elf64 strchr.asm
	@nasm -f elf64 memset.asm
	@nasm -f elf64 strcmp.asm
	@nasm -f elf64 strncmp.asm
	@nasm -f elf64 rindex.asm

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all