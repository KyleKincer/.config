function t
    set -l dir $argv[1]
    set -l name (basename $dir)

    # Check if window already exists
    set -l existing_window (tmux list-windows -F '#W' | grep -x "$name" || true)

    if test -n "$existing_window"
        # Switch to existing window
        tmux select-window -t "$name"
    else
        # Create new window
        tmux new-window -n "$name" -c "$dir"
    end
end
