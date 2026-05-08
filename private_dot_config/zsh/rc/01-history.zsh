export HISTFILE="${XDG_STATE_HOME:-$HOME/.local/state}/zsh/history" # XDG compliant location
export HISTSIZE="100000"
export SAVEHIST="${HISTSIZE}"

[[ ! -d "$(dirname $HISTFILE)" ]] && mkdir -p "$(dirname $HISTFILE)"
