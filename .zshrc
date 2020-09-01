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

[[ $TERM == xterm* ]] && zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme

zplug load

#Bind arrow up and arror down keys for histroy substring search
bindkey '\eOA' history-substring-search-up
bindkey '\eOB' history-substring-search-down

[[ -x /usr/bin/fortune ]] && fortune -s /usr/share/fortune/humorists /usr/share/fortune/riddles

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f /usr/share/fzf/key-bindings.zsh ]] || source /usr/share/fzf/key-bindings.zsh
[[ ! -f /usr/share/fzf/completion.zsh ]] || source /usr/share/fzf/completion.zsh
