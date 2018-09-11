DIR="${HOME}/dotfiles"

.PHONY: info

GIT_STATUS := $(git status -s)

test:
ifeq ($(GIT_STATUS),)
	echo GIT_STATUS is '$(GIT_STATUS)'
else
	echo "No problem, continue running..."
endif


info:
	@echo "make all|brew|dotfiles"

brew:
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew tap Homebrew/bundle
	brew bundle

DATE := $(shell date +"%F_%H-%M")

dotfiles:
	@echo $(DATE)
	cp ~/.bash_profile ~/.bash_profile_$(DATE)
	cp bash_profile ~/.bash_profile	
	cp ~/.gitconfig ~/.gitconfig_$(DATE)
	cp gitconfig ~/.gitconfig
	cp tmux.conf ~/.tmux.conf_$(DATE)
	cp tmux.conf ~/.tmux.conf
	mkdir -p ~/.ngrok2
	if [ -a ~/.ngrok2/ngrok.yml ] ; then \
		cp ~/.ngrok2/ngrok.yml ~/.ngrok2/ngrok.yml_$(DATE) ; \
	fi ;
	cp ngrok.yml ~/.ngrok2/
	if [ -a ~/.vimrc ] ; then \
		cp ~/.vimrc ~/.vimrc_$(DATE) ; \
	fi;
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim ;
	cp vimrc ~/.vim/
	ln -sf ~/.vim/vimrc ~/.vimrc

all:
	@echo "Making all."
	# THESE DON'T WORK:
	# brew
	# dotfiles

