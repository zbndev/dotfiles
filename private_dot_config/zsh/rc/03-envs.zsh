typeset -U PATH MANPATH

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [ -n "${KITTY_INSTALLATION_DIR}" ] && [ -d "${KITTY_INSTALLATION_DIR}/shell-integration/zsh" ]; then
  builtin source "${KITTY_INSTALLATION_DIR}/shell-integration/zsh/" 2>/dev/null || true
fi

export EDITOR="nvim"
export VISUAL=nvim
export SUDO_EDITOR=nvim

export TERMINAL=kitty
export COLORTERM=truecolor

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="less -R"

[[ -d "$HOME/.go/bin" ]] && export PATH="$HOME/.go/bin:${PATH}"
export GOTELEMETRY="off"
export GOPROXY="direct"
export GOTOOLCHAIN="local"

[ -d "${HOME}/.cargo/bin" ] && export PATH="${HOME}/.cargo/bin:${PATH}"

export BUN_INSTALL_BIN="$HOME/.local/bin"
export BUN_INSTALL_CACHE_DIR="$HOME/.local/share/bun/cache"
export NPM_PACKAGES="${HOME}/.local/lib/node_modules"
export PATH="${PATH}:${NPM_PACKAGES}/bin:${HOME}/.local/bin:${HOME}/.cache/.bun/bin"
export MANPATH="${MANPATH-$(manpath)}:${NPM_PACKAGES}/share/man"
export SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"
export ERL_AFLAGS="-kernel shell_history enabled"
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND="1"
export QT_QPA_PLATFORM="wayland-egl"
export THEFUCK_EXCLUDE_RULES='fix_file'

export ZAI_API_KEY=$(pass my/zai)
export OPENAI_API_KEY=$(pass my/zai)

# Fix: opencode defaults to --port 0 (ephemeral), but oh-my-openagent team mode
# defaults to port 4096. Without this, team members can't connect to the server.
export OPENCODE_PORT=4096
export PI_DIALECT=glm
