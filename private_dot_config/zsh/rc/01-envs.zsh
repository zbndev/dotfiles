export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

if [ -n "${GHOSTTY_RESOURCES_DIR}" ]; then
  builtin source \
    "${GHOSTTY_RESOURCES_DIR}/shell-integration/zsh/ghostty-integration"
fi

eval $(dircolors ~/.dircolors)

export EDITOR="nvim"
export VISUAL=nvim
export SUDO_EDITOR=nvim

export TERMINAL=ghostty
export COLORTERM=truecolor

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export PAGER="less -R"

[[ -d "$HOME/.go/bin" ]] && export PATH="$HOME/.go/bin:${PATH}"
export GOTELEMETRY="off"
export GOPROXY="direct"
export GOTOOLCHAIN="local"

[ -d "${HOME}/.cargo/bin" ] && export PATH="${HOME}/.cargo/bin:${PATH}"
[ -e "${HOME}/.cargo/env" ] && source "${HOME}/.cargo/env"

export NPM_PACKAGES="${HOME}/.local/lib/node_modules"
export PATH="${PATH}:${NPM_PACKAGES}/bin:${HOME}/.local/bin"
export MANPATH="${MANPATH-$(manpath)}:${NPM_PACKAGES}/share/man"

export ZLS_COLORS=$LS_COLORS
export SSH_KEY_PATH="${HOME}/.ssh/id_ed25519"
export ERL_AFLAGS="-kernel shell_history enabled"
export GDK_BACKEND="wayland"
export MOZ_ENABLE_WAYLAND="1"
export QT_QPA_PLATFORM="wayland-egl"
export THEFUCK_EXCLUDE_RULES='fix_file'
