ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::command-not-found

zinit light hlissner/zsh-autopair
zinit light MichaelAquilina/zsh-you-should-use
zinit light zdharma-continuum/fast-syntax-highlighting

typeset -U fpath FPATH

fpath=(
  /usr/share/zsh/vendor-completions(N-/)
  /usr/local/share/zsh-completions(N-/)
  "$HOME/.config/zsh/completions"(N-/)
  "${XDG_DATA_HOME:-$HOME/.local/share}/zsh-completions/src"(N-/)
  $fpath
)

autoload -Uz compinit
local zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
if [[ -s $zcompdump && (! -s $zcompdump(#qN.mh+24)) ]]; then
  compinit -C
else
  compinit
fi

if [[ ! -s $zcompdump.zwc || $zcompdump -nt $zcompdump.zwc ]]; then
  zcompile $zcompdump
fi

zinit cdreplay -q
