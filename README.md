# HOSTMUX

hostmux is a small wrapper script for tmux to easily connect to a series of hosts via ssh and open a split pane for each of the hosts. Using the synchronize-pane feature of tmux, commands can be easily broadcasted/multiplexed. This is a light weight replacement for tools like csshX on OS X.

## Usage

```
HOSTMUX(1)                  General Commands Manual                 HOSTMUX(1)

NAME
     hostmux - Connects to a list of hosts via ssh in separate tmux split
     panes

SYNOPSIS
     hostmux [-s session-name] [-l tmux-layout] [-x] [-r remote-host] [-h] [host_a] [host_b]
             [host_n]

DESCRIPTION
     Call hostmux followed by a list of hosts you want to connect to via ssh.
     The script will create a new tmux session with a split pane for each
     specified host and connect to it.

     You can then use the synchronize-panes feature of tmux to
     multiplex/broadcast commands to all split panes / servers

     Its arguments are as follows:

     -s      Specify a name for the tmux session. It defaults to `hostmux'
             which means that you can have only one hostmux session at a time
             if you don't specify unique names for your sessions

     -l      Specify a valid tmux layout e.g. even-horizontal, tiled, etc. It
             defaults to `even-vertical'
             
     -r      Specify a remote host used to jump to the hosts in a secured
             environment.

     -x      Close the pane and/or session automatically when the ssh session
             session exits successfully

     -x      Close the pane and/or session automatically when the ssh session
             session closes successfully

     -h      Display usage information

     host    Specify a space separated list of one or more user@hostname ssh
             targets. This is what you would pass to the ssh command when you
             are connecting to a host. Currently there is no support for
             passing additional flags to ssh. If you do need them, add them to
             your ~/.ssh/config
```

## TMUX Keybindings

The following two key bindings can be added to your .tmux.conf for even more convenience.

```
# This toggles the synchronize-panes feature
bind-key a set-window-option synchronize-panes
# This allows killing the whole session with a simple short cut:
bind-key X kill-session
```

## Installing on OS X via Homebrew

```
brew tap hukl/homebrew-tap
brew install hostmux
```

## Installing the ZSH completion

This repo contains a zsh completion file which needs to be added to your other zsh completions.

Find or create an appropriate directory, copy the completion file and if the directory isn't 
already in your ```$fpath``` then add this to your .zshrc:

```
# Extend Autocomplete Search Path
fpath=(/path/to/your/completions/dir $fpath)
```

## Building / Installing the manpage

To install the man page copy ```man/hostmux.1``` to your local man page folder e.g. ```/usr/local/share/man/man1/hostmux.1```

The manpage is written with mandoc and "rendered" to be legacy compatible using the this command:

```
mandoc -Tman hostmux.mandoc > man/hostmux.1
```

## Suggestions for Improvement?

Let me know!
