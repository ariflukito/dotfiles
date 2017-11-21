source /usr/share/zsh/scripts/zplug/init.zsh

DEFAULT_USER=$USER

# Load some plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"

if [[ $TERM != "linux" && $TERM != "xterm" ]]; then
    zplug "zsh-users/zsh-autosuggestions"

    # Load powerlevel9k prompt
    POWERLEVEL9K_MODE='awesome-patched'
    POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
    POWERLEVEL9K_SHORTEN_DELIMITER=""
    POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
    zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
fi

zplug load

#Bind arrow up and arror down keys for histroy substring search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

[[ -x /usr/bin/fortune ]] && fortune -s /usr/share/fortune/humorists /usr/share/fortune/riddles
