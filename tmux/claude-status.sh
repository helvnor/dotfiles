#!/usr/bin/env sh

[ -n "$TMUX_PANE" ] || exit 0
command -v tmux > /dev/null 2>&1 || exit 0

case "$1" in
    busy | wait | ready) tmux set-option -w -t "$TMUX_PANE" @claude "$1" 2> /dev/null ;;
    clear) tmux set-option -uw -t "$TMUX_PANE" @claude 2> /dev/null ;;
    *) exit 0 ;;
esac

tmux refresh-client -S 2> /dev/null

exit 0
