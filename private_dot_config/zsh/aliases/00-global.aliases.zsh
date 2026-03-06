alias vim='nvim'
alias cat='bat'

alias ls='eza --icons --git --time-style=iso --group --smart-group'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -la'
alias lt='ls --tree --icons=always'

alias rmrf='rm -rf'
alias .z='source ~/.config/zsh/.zshrc'

alias c='clear'

alias avante='nvim -c "lua vim.defer_fn(function()require(\"avante.api\").zen_mode()end, 100)"'
