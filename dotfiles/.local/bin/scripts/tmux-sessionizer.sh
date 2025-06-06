#!/usr/bin/env bash
paths=(home/jackanderson/projects/CVS/cvs-data-migration/scripts/Glue/ATI/documentMigration/provingsharepoint /home/jackanderson/projects/CVS/CVS-TAS-Document-Migration/function_app_update_permissions_sharepoint)

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$( (printf "%s\n" "${paths[@]}"; find ~/projects ~/dev_setup -mindepth 1 -maxdepth 2 -type d -not -path '*/.*') | fzf --preview '')
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
    tmux attach -t $selected_name
else
    tmux switch-client -t $selected_name
fi
