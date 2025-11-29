# use nvim as default
export VISUAL=nvim
export EDITOR="$VISUAL"

# rust
source "$HOME/.cargo/env"

# go
export PATH="$PATH:/usr/local/go/bin"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# ruby
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"

# java
export JAVA_HOME="$HOME/.jdks/openjdk-21.0.1"
export PATH=$JAVA_HOME/bin:$PATH

# chrome
export CHROME_BIN=/usr/bin/chromium-browser

# dprint
export DPRINT_INSTALL="/home/simon/.dprint"
export PATH="$DPRINT_INSTALL/bin:$PATH"

# zig
export PATH="$PATH:$HOME/opt/zig"

# erlang
source "$HOME/.local/lib/erlang/28.0/activate"

# elixir
export PATH="$PATH:$HOME/opt/elixir/bin"

# make sure MANPATH is set (was overriden by erlang)
export MANPATH="/usr/share/man:/usr/local/share/man:$MANPATH:"
