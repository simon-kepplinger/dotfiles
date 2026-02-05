#!/usr/bin/env bash

STOW_ROOT="$HOME/dotfiles"
DEFAULT_DIRS="bin,git,nvim,tmux,tmuxinator,ghostty,yazi,zsh,biome,opencode,shell_gpt"

if [[ -z $STOW_DIRS ]]; then
  STOW_DIRS="$DEFAULT_DIRS"
fi

pushd "$STOW_ROOT"

for dir in $(echo $STOW_DIRS | sed "s/,/ /g"); do
  echo "uninstall $dir"
  stow -D $dir
done

echo "🚮 all symlinks removed from the system"

popd
