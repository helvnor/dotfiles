function tmux-dev 
    set SESSION "dev"

    tmux has-session -t $SESSION 2>/dev/null

    if test $status != 0
        tmux new-session -d -s $SESSION -n "EDITOR" -c ~/Code
        tmux new-window -t $SESSION -n "SERVER" -c ~/Code
        tmux new-window -t $SESSION -n "SHELL" -c ~/
        tmux new-window -t $SESSION -n "CLAUDE" -c ~/Code
        tmux new-window -t $SESSION -n "OBSIDIAN" -c ~/Obsidian/main
        tmux send-keys -t $SESSION:OBSIDIAN "nvim" C-m
        
        tmux select-window -t $SESSION:DEV
    end

    tmux attach-session -t $SESSION
end
