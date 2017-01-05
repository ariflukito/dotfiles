[[ -f $HOME/.antigenrc ]] && source $HOME/.antigenrc

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[[ -x /usr/bin/fortune ]] && fortune -s
