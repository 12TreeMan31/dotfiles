DIRS := bash/ dots/
all:
	stow --dotfiles $(DIRS)

clean: 
	stow -D $(DIRS)
