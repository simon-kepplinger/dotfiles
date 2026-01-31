# Oh-My-Zsh base
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vi-mode
)

# ---- zsh-autosuggestions ----
# use both history and completion for suggestions
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# acccept only a single word
bindkey '^ ' forward-word

# init zsh-vi-mode instantly https://stackoverflow.com/a/77204401/12237560
ZVM_INIT_MODE=sourcing

source "$ZSH/oh-my-zsh.sh"

# p10k theme (after OMZ so its functions exist)
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# ---- zsh-vi-mode ----
# disable the cursor style feature
ZVM_CURSOR_STYLE_ENABLED=false

# use 'N' in normal mode
typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='N'
