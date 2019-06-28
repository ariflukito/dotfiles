source /usr/share/zsh/scripts/zplug/init.zsh

# Load some plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"

[[ $TERM == xterm* ]] || : ${PURE_POWER_MODE:=portable}
source ~/.purepower
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

zplug load

#Bind arrow up and arror down keys for histroy substring search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

[[ -x /usr/bin/fortune ]] && fortune -s /usr/share/fortune/humorists /usr/share/fortune/riddles
