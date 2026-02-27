# My personal dotfiles

![screenshot](assets/screenshot.png)

## 🚀 Zsh setup:

- ⌨️ Emacs mode _(for people without mental diseases)_ with ctrl + arrows, home/end buttons and ctrl+backspace/del
- 🛠️ A bunch of useful plugins managed with Zinit
  - zsh-completions
  - zsh-autosuggestions
  - fzf-tab
  - zsh-autopair
  - zsh-you-should-use
  - fast-syntax-highlighting
- 🪄 Some ~~I use~~ Arch ~~btw~~ polishing (like package info in fzf-tab when using Yay)

## 📦 Packages used:

### 🦀 Cargo:

- **starship** - minimalistic shell prompt
- **eza** - ls on steroids (like files icons)
- **bat** - cat on steroids
- **atuin** - upgrades your up arrow key

### 🐧 System:

```bash
yay -S --needed caelestia-shell-git caelestia-cli-git hyprland \
                  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk \
                  wl-clipboard cliphist inotify-tools app2unit \
                  wireplumber trash-cli foot zsh fastfetch jq \
                  adw-gtk-theme papirus-icon-theme qt5ct-kde qt6ct-kde \
                  ttf-jetbrains-mono-nerd thunar zoxide thefuck lazygit
```
