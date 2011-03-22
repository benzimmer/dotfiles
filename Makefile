PWD := $(shell pwd)
UNAME := $(shell uname)
ifeq ($(UNAME),Linux)
	LSB := $(shell lsb_release -si)
endif

install: install-git install-vim install-zsh

install-vim:
	rm -rf ~/.vim ~/.vimrc ~/.vimrc.local
	ln -s $(PWD)/vim ~/.vim
	ln -s $(PWD)/vimrc.local ~/.vimrc.local
	ln -s ~/.vim/vimrc ~/.vimrc

install-zsh:
	rm -f ~/.zshrc

ifeq ($(UNAME),Linux)

ifeq ($(LSB),Ubuntu)
	ln -s $(PWD)/zshrc_ubuntu ~/.zshrc
endif

endif

ifeq ($(UNAME),Darwin)
	ln -s $(PWD)/zshrc_mac ~/.zshrc
endif

install-git:
	rm -f ~/.gitignore ~/.gitconfig
	ln -s $(PWD)/gitignore ~/.gitignore
	ln -s $(PWD)/gitconfig ~/.gitconfig
