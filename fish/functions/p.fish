function p
    # High level project navigation
    set -l dir (goto)
    if test -n "$dir"
        if set -q TMUX
            t "$dir"
        else
            cd "$dir"
        end
    end
end
