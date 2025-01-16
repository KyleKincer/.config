function goto
    # Get full paths but display only basenames
    set -l dirs (fd --type d --max-depth 1 . ~/src)
    set -l basenames (for dir in $dirs; basename $dir; end)

    # Prepend home directory option
    set -l home_dir $HOME
    set dirs $home_dir $dirs
    set basenames "~" $basenames

    # Use basename for display, then map back to full path
    set -l selected_base (printf '%s\n' $basenames | fzf --layout=reverse)
    if test -n "$selected_base"
        echo $dirs[(contains -i $selected_base $basenames)]
    end
end
