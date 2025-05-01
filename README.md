# dotfiles
A curated collection of configuration files I rely on across my Linux machines. Everything is managed with GNU Stow for painless, reversible installs.

## Installation
Clone into the standard location and pull submodules in one shot:
```bash
git clone --recurse-submodules git@github.com:simon-kepplinger/dotfiles.git ~/dotfiles
```

To install the configs you can simply run the install script from the project root.
```bash
cd ~/dotfiles
./install.sh        # stows all modules listed in install.sh
```

#### Install tmux plugins
Once the configs are in place, launch tmux and press `<prefix> I` to fetch and install every plugin via TPM.

## Uninstall
Remove all symlinks created by Stow and restore the previous state:
```bash
cd ~/dotfiles
./uninstall.sh
```

## Pre commit hooks
Secrets detection is enforced via pre‑commit + gitleaks.
```bash
pipx install pre-commit
cd ~/dotfiles
pre-commit install
```

Run the hooks on demand:
```bash
pre-commit run --all-files
```
