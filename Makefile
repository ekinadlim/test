SRCDIR = src
OBJDIR = obj

FILES = main another shell more
SOURCE = $(addprefix $(SRCDIR)/, $(addsuffix .c, $(FILES)))
OBJECT = $(addprefix $(OBJDIR)/, $(addsuffix .o, $(FILES)))

NAME = test

CC = cc
RM = rm -rf

all: $(NAME)

$(NAME): $(OBJECT)
	$(CC) $(OBJECT) -o $(NAME)

$(OBJDIR)/%.o:$(SRCDIR)/%.c | $(OBJDIR)
	$(CC) -c $< -o $@

$(OBJDIR):
	mkdir $(OBJDIR)

clean:
	$(RM) $(OBJECT)

fclean: clean
	$(RM) $(NAME)

re: fclean $(NAME)

.PHONY: all clean fclean re