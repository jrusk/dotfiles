DIR="${HOME}/dotfiles"

.PHONY: info

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
	cp ~/.tmux.conf ~/.tmux.conf_$(DATE)
	cp tmux.conf ~/.tmux.conf
	mkdir -p ~/.ngrok2
	cp ~/.ngrok2/ngrok.yml_$(DATE)
	cp ngrok.yml ~/.ngrok2/
	if [ -a ~/.vimrc ] ; \
		then cp ~/.vimrc ~/.vimrc_$(DATE) ; \
	fi;
	mkdir -p ~/.vim
	cp vimrc ~/.vim/
	ln -sf ~/.vim/vimrc ~/.vimrc

all:
	@echo "Making all."
	brew
	dotfiles

