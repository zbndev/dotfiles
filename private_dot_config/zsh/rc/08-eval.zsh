eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
eval "$(atuin init zsh)"
eval "$(thefuck --alias fuck)"
eval "$(starship init zsh)"

if [[ -f ~/.local/state/caelestia/sequences.txt ]]; then
  /usr/bin/cat ~/.local/state/caelestia/sequences.txt
fi

mark_prompt_start() {
  printf "\e]133;A\e\\"
}
precmd_functions+=(mark_prompt_start)
