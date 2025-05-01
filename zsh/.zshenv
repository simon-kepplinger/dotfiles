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

# chrome
export CHROME_BIN=/usr/bin/chromium-browser
