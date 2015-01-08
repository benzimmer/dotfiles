PWD := $(shell pwd)
UNAME := $(shell uname)
ifeq ($(UNAME),Linux)
	LSB := $(shell lsb_release -si)
endif

install: install-git install-vim install-zsh install-tmux

install-tmux:
	rm -rf ~/.tmux.conf
	ln -s $(PWD)/tmux.conf ~/.tmux.conf

install-vim:
	rm -rf ~/.vim ~/.vimrc
	ln -s $(PWD)/vim ~/.vim
	ln -s ~/.vim/vimrc ~/.vimrc

install-zsh:
	rm -f ~/.zshrc

ifeq ($(UNAME),Linux)

ifeq ($(LSB),Ubuntu)
	ln -s $(PWD)/zshrc_deb ~/.zshrc
endif

ifeq ($(LSB),Debian)
	ln -s $(PWD)/zshrc_deb ~/.zshrc
endif

endif

ifeq ($(UNAME),Darwin)
	ln -s $(PWD)/zshrc ~/.zshrc
endif

install-git:
	rm -f ~/.gitignore ~/.gitconfig
	ln -s $(PWD)/gitignore ~/.gitignore
	ln -s $(PWD)/gitconfig ~/.gitconfig
