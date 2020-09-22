export ZSH=$HOME/.oh-my-zsh
export FZF_DEFAULT_COMMAND="find -L"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export HOME_FOLDER="/root/"

export DOCKER_HOST=tcp://host.docker.internal:2375
export DEFAULT_USER="$(whoami)"

source /root/.aliases

bindkey -s '^f' 'nvim $(fzf --height 40% --reverse)^M'