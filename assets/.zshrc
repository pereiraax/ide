export ZSH=/root/.oh-my-zsh
export HOME_FOLDER="/root/"

# ZSH_THEME="agnoster"


alias tmux="tmux -2 -u" 
if which tmux 2>&1 >/dev/null; then 
     test -z "$TMUX" && (tmux attach || tmux new-session) 
     # tmux set mouse
fi

export DOCKER_HOST=tcp://host.docker.internal:2375

source $ZSH/oh-my-zsh.sh
source ~/.aliases





