bindkey -e          # emacs mode

# [Backspace] - delete backward
bindkey -M emacs '^?' backward-delete-char
# [Delete] - delete forward
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey -M emacs "${terminfo[kdch1]}" delete-char
else
  bindkey -M emacs "^[[3~" delete-char
  bindkey -M emacs "^[3;5~" delete-char
fi

# [Ctrl-Delete] - delete whole forward-word
bindkey -M emacs '^[[3;5~' kill-word
# [Ctrl-RightArrow] - move forward one word
bindkey -M emacs '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey -M emacs '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
# Inside tmux with extended-keys-format=csi-u, Ctrl+Backspace sends \E[127;5u
bindkey '^[[127;5u' backward-kill-word

# [Home] / [End] - bind every variant kitty + tmux may send
#   kitty (xterm-256color):  \E[H / \E[F   (normal)  |  \EOH / \EOF   (app cursor)
#   inside tmux-256color:    \E[1~ / \E[4~  (terminfo khome/kend)
bindkey -M emacs '^[[H'   beginning-of-line
bindkey -M emacs '^[[F'   end-of-line
bindkey -M emacs '^[[1~'  beginning-of-line
bindkey -M emacs '^[[4~'  end-of-line
bindkey -M emacs '^[OH'   beginning-of-line
bindkey -M emacs '^[OF'   end-of-line
if [[ -n "${terminfo[khome]}" ]]; then
  bindkey -M emacs "${terminfo[khome]}" beginning-of-line
fi
if [[ -n "${terminfo[kend]}" ]]; then
  bindkey -M emacs "${terminfo[kend]}" end-of-line
fi

# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line