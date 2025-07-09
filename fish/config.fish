set -g fish_greeting ""
set -g fish_prompt_pwd_dir_length 0

# Homebrew setup (conditional for macOS)
if test (uname) = Darwin
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

# Go setup
set -gx GOPATH $HOME/go
set -gx GOBIN $GOPATH/bin
set -gx PATH $PATH $GOBIN

# GCP project for Gemini CLI
set -gx GOOGLE_CLOUD_PROJECT prod-sweetwater-web-947ceea6

if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -v fastfetch >/dev/null
        fastfetch
    end
end

# cargo
set -gx PATH $HOME/.cargo/bin $PATH

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# Alias for lazygit
function lg
    lazygit $argv
end
