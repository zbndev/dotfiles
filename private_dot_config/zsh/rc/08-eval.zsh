# Cached evals — generate output once, cache to file, source from cache on subsequent runs
# Cache invalidates automatically when tool version changes

# fzf (static output)
if (( $+commands[fzf] )); then
  _cache_eval fzf --zsh
fi

# zoxide (static output)
if (( $+commands[zoxide] )); then
  _cache_eval zoxide init --cmd cd zsh
fi

# starship (static output, must run BEFORE prompt renders)
if (( $+commands[starship] )); then
  _cache_eval starship init zsh
fi

# dircolors (static output, depends on ~/.dircolors file)
if [[ -f ~/.dircolors ]] && (( $+commands[dircolors] )); then
  _cache_eval dircolors ~/.dircolors
  export ZLS_COLORS=$LS_COLORS
fi

# Completion colors — MUST be after LS_COLORS is set, not in rc/05
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# atuin — SPECIAL HANDLING: cache static init, dynamic per-session lines
if (( $+commands[atuin] )); then
  # Cache the static part of atuin init (keybindings, config, widgets)
  # ATUIN_SESSION and ATUIN_SHLVL must be unique per shell
  _cache_eval atuin init zsh
  # Generate unique session UUID for each shell
  export ATUIN_SESSION="$(atuin uuid 2>/dev/null)"
  export ATUIN_SHLVL=$SHLVL
fi

# Lazy-load thefuck — only initializes on first use
fuck() {
  unset -f fuck
  eval "$(thefuck --alias fuck)"
  fuck "$@"
}
