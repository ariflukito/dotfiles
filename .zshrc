[[ -x /usr/bin/fortune ]] && fortune fortunes

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh/scripts/zplug/init.zsh

# Load some plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
[[ (( $+commands[fzf] )) ]] && zplug "wfxr/forgit"
[[ $TERM == xterm* ]] && zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

zplug load

# Bind arrow up and arror down keys for histroy substring search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# FZF Fuzzy Finder
[[ ! -f /usr/share/fzf/key-bindings.zsh ]] || source /usr/share/fzf/key-bindings.zsh
[[ ! -f /usr/share/fzf/completion.zsh ]] || source /usr/share/fzf/completion.zsh
export FZF_DEFAULT_COMMAND='fd --hidden --follow --type f --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="
    --height 40%
    --color=dark,info:8,gutter:0,bg+:8,hl:2,hl+:2,pointer:2,marker:2
    --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || bat -n --color=always {}'
    --preview-window='right:noborder:wrap'
    --bind='ctrl-/:toggle-preview'"
export FORGIT_FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS $FORGIT_FZF_DEFAULT_OPTS"

if [[ $TERM == xterm* ]]; then
    [[ -x /usr/bin/logo-ls ]] && alias ls=logo-ls
fi

# Set colourscheme for Virtual Console
if [ "$TERM" = "linux" ]; then
    echo -en "\e]P01A1E24" #black
    echo -en "\e]P83B4453" #darkgrey
    echo -en "\e]P1EE6165" #darkred
    echo -en "\e]P9EE6165" #red
    echo -en "\e]P291B859" #darkgreen
    echo -en "\e]PA91B859" #green
    echo -en "\e]P3FAC751" #brown
    echo -en "\e]PBFAC751" #yellow
    echo -en "\e]P46398CF" #darkblue
    echo -en "\e]PC6398CF" #blue
    echo -en "\e]P5C28AA3" #darkmagenta
    echo -en "\e]PDC28AA3" #magenta
    echo -en "\e]P65BB3B4" #darkcyan
    echo -en "\e]PE5BB3B4" #cyan
    echo -en "\e]P7CDD3DF" #lightgrey
    echo -en "\e]PFCDD3DF" #white
    clear
fi
