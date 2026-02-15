autoload -Uz compinit
for dump in "${ZDOTDIR:-$HOME}/.zcompdump"(N.m1); do
  compinit -C # -C skips the security check and uses the cache if it exists
done
if [[ ! -f "${ZDOTDIR:-$HOME}/.zcompdump" ]]; then
  compinit
fi
