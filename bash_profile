# Ensure user-installed binaries take precedence
# https://github.com/Homebrew/homebrew-core/issues/15746
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc

# Python virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh

# Prompt, colors, ls enhancments
# jrusk-iMac:~/full/current_dir$
# export PS1="\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
# current_dir$
export PS1="\[\033[33;1m\]\W\[\033[m\]\$ "

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -G'
alias ll='ls -GHhl'

