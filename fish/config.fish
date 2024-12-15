set -g fish_greeting ""
eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -v fastfetch >/dev/null
        fastfetch
    end
end
