source /usr/share/zsh/scripts/zplug/init.zsh

# Powerlevel9k prompt settings
DEFAULT_USER=$USER
POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# Load some plugins
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "bhilburn/powerlevel9k", use:powerlevel9k.zsh-theme
zplug load

# Change color to suit solarized color scheme
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# Change highlight colours for history substring search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=blue,bold,bg=black'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold,bg=black'

zplug "plugins/sudo", from:oh-my-zsh

#Bind arrow up and arror down keys for histroy substring search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

[[ -x /usr/bin/fortune ]] && fortune -s
