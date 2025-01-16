set -g fish_greeting ""
set -g fish_prompt_pwd_dir_length 0
eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -v fastfetch >/dev/null
        fastfetch
    end
end
