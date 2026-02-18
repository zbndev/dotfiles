if exists fzf; then
  # Custom configs
  export FZF_COMPLETION_TRIGGER="'"
  export FZF_DEFAULT_OPTS="
    --no-mouse --height=50% -1 --reverse --multi --inline-info
    --preview '([[ -f {} ]] && [[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file) || ([[ -f {} ]] && (batcat --style=numbers --color=always {} || bat --style=numbers --color=always {} || cat {}) 2>/dev/null) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2>/dev/null | head -200'
    --preview-window='right:hidden:wrap'
    --bind='ctrl-v:execute(batcat --style=numbers --color=always {} < /dev/tty > /dev/tty 2>/dev/null || bat --style=numbers --color=always {} < /dev/tty > /dev/tty 2>/dev/null || less -f {} < /dev/tty > /dev/tty 2>7dev/null)'
    --bind 'ctrl-e:execute(nvim {} < /dev/tty > /dev/tty 2>&1)'
    --bind='ctrl-p:toggle-preview'
    --bind='ctrl-d:half-page-down'
    --bind='ctrl-u:half-page-up'
    --bind='ctrl-a:select-all'
    --bind='ctrl-y:execute-silent(echo -n {+} | xclip -in -selection clipboard)'
    --color=fg:#dbdbdb,bg:-1,hl:#5f87af
    --color=fg+:#ffffff,bg+:-1,hl+:#5fd7ff
    --color=info:#afaf87,prompt:#d7005f,pointer:#af5fff
    --color=marker:#87ff00,spinner:#af5fff,header:#87afaf"

  # If fd is installed, use it as the default source for fzf
  if exists fd; then
    export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude ".git" --exclude "node_modules"'
    export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}
    export FZF_ALT_C_COMMAND='fd --type d --strip-cwd-prefix --hidden --follow --exclude ".git" --exclude "node_modules"'

    # Use fd for listing path candidates.
    # - The first argument to the function ($1) is the base path to start traversal
    _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
  # If not, try to use ripgrep
  elif exists rg; then
    export FZF_DEFAULT_COMMAND='rg --files --hidden --smart-case --no-ignore-vcs --glob "!.git/" --glob "!node_modules/"'
    export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}
  fi

  FZF_USERDATA="${HOME}/.local/share/fzf"
fi

if exists bat || exists batcat; then
  export BAT_PAGER='less -R'
fi

if exists gpgconf; then
  export GPG_TTY=$(tty)
  export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  gpgconf --launch gpg-agent
fi
