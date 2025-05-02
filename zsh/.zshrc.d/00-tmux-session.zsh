# automatically attach to the default tmux session (or create it)
if [[ -o interactive ]] && [[ -z "$TMUX" ]]; then
    exec tmux new-session -A -s _default
fi

