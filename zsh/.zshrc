# bootstrap all .zsh scripts from the .zshrc.d directory
for script ($HOME/.zshrc.d/*.zsh(N)); do
    source "$script"
done
