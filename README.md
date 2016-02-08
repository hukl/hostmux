# Toolbox


```
HOSTMUX(1)                  General Commands Manual                 HOSTMUX(1)

NAME
     hostmux - Connects to a list of hosts via ssh in separate tmux split
     panes

SYNOPSIS
     hostmux [-s session-name] [-l tmux-layout] [-h] [host_a] [host_b]
             [host_n]

DESCRIPTION
     Call hostmux followed by a list of hosts you want to connect to via ssh.
     The script will create a new tmux session with a split pane for each
     specified host and connect to it.

     You can then use the synchronize-panes feature of tmux to
     multiplex/broadcast commands to all split panes / servers

     Its arguments are as follows:

     -s      Specify a name for the tmux session. It defaults to hostmux,
             which means that you can have only one hostmux session at a time
             if you don't specify unique names for your sessions

     -l      Specify a valid tmux layout e.g. even-horizontal, tiled, etc. It
             defaults to even-vertical

     -h      Display usage information

     host    Specify a space separated list of one or more user@hostname ssh
             targets. This is what you would pass to the ssh command when you
             are connecting to a host. Currently there is no support for
             passing additional flags to ssh. If you do need them, add them to
             your ~/.ssh/config
```
