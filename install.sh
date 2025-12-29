#!/usr/bin/env bash

STOW_ROOT="$HOME/dotfiles"
DEFAULT_DIRS="bin,git,nvim,tmux,tmuxinator,ghostty,yazi,zsh,biome"

if [[ -z $STOW_DIRS ]]; then
  STOW_DIRS="$DEFAULT_DIRS"
fi

pushd "$STOW_ROOT"

for dir in $(echo $STOW_DIRS | sed "s/,/ /g"); do
  echo "install $dir"
  stow -vR $dir
done

echo "✅ all files install to the system"

popd
