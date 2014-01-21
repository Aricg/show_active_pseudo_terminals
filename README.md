show_active_pseudo_terminals
============================

Shows pts sessions that have been active in the last $maxtime minutes, call from your bashrc  

Example usage (show users active in the last 5 minutes excuding the terminal calling this script):

    tty=$(tty); w -h | awk -vtty=${tty#/*/} -vmaxtime=5 -f getusers -
