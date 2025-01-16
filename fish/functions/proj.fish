function proj
    # Debug at start
    echo "Starting proj function" >/tmp/proj_debug.log 2>&1
    
    set -l dirs (fd --type d --max-depth 1 . ~/src)
    
    if status is-interactive
        if test (count $argv) -eq 0
            set -l display_names
            for dir in $dirs
                set -a display_names (basename $dir)
            end
            
            set -l selected_name (printf "%s\n" $display_names | fzf)
            # Debug after fzf selection
            echo "Selected name: $selected_name" >>/tmp/proj_debug.log 2>&1
            
            if test -n "$selected_name"
                set dir (string match -r ".*/$selected_name\$" $dirs)[1]
                # Debug matched directory
                echo "Matched full path: $dir" >>/tmp/proj_debug.log 2>&1
            end
        else
            set dir $argv[1]
        end
    else
        set -l display_names
        for dir in $dirs
            set -a display_names (basename $dir)
        end
        set -l selected_name (printf "%s\n" $display_names | fzf)
        echo "Selected name: $selected_name" >>/tmp/proj_debug.log 2>&1
        
        if test -n "$selected_name"
            set dir (string match -r ".*/$selected_name\$" $dirs)[1]
            echo "Matched full path: $dir" >>/tmp/proj_debug.log 2>&1
        end
    end
    
    if test -n "$dir"
        set -l window_name (basename $dir)
        echo "TMUX env var: $TMUX" >>/tmp/proj_debug.log 2>&1
        if test -n "$TMUX"
            echo "Attempting to create new window for $dir" >>/tmp/proj_debug.log 2>&1
            tmux new-window -c "$dir" -n "$window_name"
            echo "After new-window command" >>/tmp/proj_debug.log 2>&1
        else
            echo "Not in tmux, changing directory to $dir" >>/tmp/proj_debug.log 2>&1
            cd "$dir"
        end
    end
end
