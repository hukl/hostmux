# HOSTMUX

hostmux is a small wrapper script for tmux to easily connect to a series of
hosts via ssh and open a split pane for each of the hosts. Using the
synchronize-pane feature of tmux, commands can be easily
broadcasted/multiplexed. This is a light weight replacement for tools like
csshX on OS X.

## Usage

<!-- read manpage in vim: ":r!MANWIDTH=79 man man/hostmux.1" -->
```
SYNOPSIS
       hostmux [-h] | [-s session-name] [-l tmux-layout] [-x] [-p] [-P] [-S]
               host1 [host2 ...]

DESCRIPTION
       Call hostmux followed by a list of hosts you want to connect to via
       ssh.  The script will create a new tmux session with a split pane for
       each specified host and connect to it.

       You can then use the synchronize-panes feature of tmux to
       multiplex/broadcast commands to all split panes / servers (see -S).

       Its arguments are as follows:

       -s      Specify a name for the tmux session. It defaults to 'hostmux'
               which means that you can have only one hostmux session at a
               time if you don't specify unique names for your sessions

       -l      Specify a valid tmux layout e.g. even-horizontal, tiled, etc.
               It defaults to

       -x      Close the pane and/or session automatically when the ssh
               session exits successfully

       -p      Identify panes by setting the pane title to the ssh hostname
               (tmux >= 2.3), may not work if the remote host does $PS1 magic
               like setting the terminal title, in that case use -P

       -P      Identify panes by setting the remote prompt $PS1 to
               "[<hostname>]$ " after login

       -S      Synchronize panes, i.e. type commands simultaneously in all
               panes

       -h      Display usage information

       host    Specify a space separated list of one or more user@hostname
               ssh targets. This is what you would pass to the ssh command
               when you are connecting to a host. Currently there is no
               support for passing additional flags to ssh. If you do need
               them, add them to your ~/.ssh/config
```

## TMUX Keybindings

The following key bindings can be added to your .tmux.conf for even more
convenience.

```
# This toggles the synchronize-panes feature, or use hostmux -S.
bind-key a set-window-option synchronize-panes
# This allows killing the whole session, or use hostmux -x
bind-key X kill-session
```

## Installing on OS X via Homebrew

```
brew install hukl/tap/hostmux
```

## Installing the ZSH completion

This repo contains a zsh completion file which needs to be added to your other
zsh completions.

Find or create an appropriate directory, copy the completion file and if the
directory isn't already in your `$fpath` then add this to your .zshrc:

```
# Extend Autocomplete Search Path
fpath=(/path/to/your/completions/dir $fpath)
```

## Building / Installing the manpage

Build `man/hostmux.1` (roff format) with the `Makefile` from `hostmux.mandoc`
(BSD default mandoc format) using `mandoc` (Debian: `apt-get install mandoc`).
Copy it to your local man page folder e.g.
`/usr/local/share/man/man1/hostmux.1`

## The pane title

When using `-p`, then `hostmux` will try to display the command line hostname
(`host1`, `host2`, ...) in the border of every pane. This is done by [setting
the tmux variable `pane_title`][man_tmux] via `printf '\033]2;hostN\007`. This
works, unless the remote meachine does some PS1 magic which involves [setting
the terminal title][term_title] (e.g. in bash: `PS1="\[\033]0;\u@\h:\w\007\]$
"`. Then, tmux uses that title as `pane_title` and, for unknown reasons,
resetting it using `printf ...` doesn't change `pane_title` anymore. In that
case, you can either simplify the remote's PS1 magic (e.g. just
`PS1="[\u@\h:\w]$ "`) or force `PS1="[hostN]$ "` using `hostmux -P` (capital
P).

[man_tmux]: https://www.freebsd.org/cgi/man.cgi?query=tmux&sektion=1&apropos=0&manpath=FreeBSD+11.0-RELEASE+and+Ports#NAMES_AND_TITLES 
[term_title]: http://tldp.org/HOWTO/Xterm-Title-3.html

## Suggestions for Improvement?

Let me know!
