## Automatically attach to the default tmux session (or create it)
if [[ -o interactive ]] && [[ -z "$TMUX" ]]; then
  tmux new-session -A -s default
fi

