# Oh-My-Zsh base
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-vim-mode
)

source "$ZSH/oh-my-zsh.sh"

# p10k theme (after OMZ so its functions exist)
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
