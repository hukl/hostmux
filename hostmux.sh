#!/bin/sh

# Keybinding suggestions:
# bind-key a set-window-option synchronize-panes
# bind-key X kill-session

SESSION=bfc_hosts
NUMBER_OF_HOSTS=$#

                                                                                                                                                                                                                                                                                                                            
# Initialize Session
tmux -2 new-session -d -s $SESSION


# Split as many times as we have hosts as arguments and reset
# the layout each time for even distribution
LOOP_INDEX=1

while [ $LOOP_INDEX -lt $NUMBER_OF_HOSTS ]
do
  tmux split-window -h -d
  tmux select-layout even-vertical

  LOOP_INDEX=$(($LOOP_INDEX+1))
done


# Loop through the panes and take the first argument as a ssh host
# then shift the argument list left, increase the index and go
# into next iteration. Now $1 refers to the next argument passed
# to the script
PANE_INDEX=0
PANE_MAX=$(($NUMBER_OF_HOSTS-1))

while [ $PANE_INDEX -le $PANE_MAX ]
do
  tmux send-keys -t $PANE_INDEX "ssh $1" C-m 

  shift
  PANE_INDEX=$(($PANE_INDEX+1))
done


# Attach to the session
tmux -2 attach-session -t $SESSION
