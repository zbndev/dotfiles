WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
zmodload -i zsh/complist

autoload -Uz add-zsh-hook

# --- General Completion Behavior ---
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"
zstyle ':completion:*' rehash true
zstyle ':completion:*' menu select
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'
zstyle ':fzf-tab:*' fzf-flags --style=full --height=60% --pointer '>' \
                --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
                --input-label ' Search ' --color 'input-border:blue,input-label:blue:bold' \
                --list-label ' Results ' --color 'list-border:green,list-label:green:bold' \
                --preview-label ' Preview ' --color 'preview-border:magenta,preview-label:magenta:bold'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a $realpath'
zstyle ':fzf-tab:complete:bat:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview 'bat --color=always --theme=base16 $realpath'
zstyle ':fzf-tab:complete:yay:*' fzf-preview \
  'if [[ "$group" == *"package"* ]]; then
    (yay -Si $word) 2>/dev/null | bat --color=always --language=help
  elif [ -d "$realpath" ]; then
    eza -1 --color=always "$realpath"
  elif [ -f "$realpath" ]; then
    bat --color=always "$realpath"
  fi'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:complete:systemctl-*:*' fzf-preview 'systemctl status $word'

# --- The "No Duplicates" Rule ---
zstyle ':completion:*:*:(pacman|yay):*' ignore-line other

export ZLS_COLORS=$LS_COLORS
