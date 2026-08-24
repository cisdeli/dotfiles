#!/usr/bin/env bash
# Installs everything these dotfiles need on WSL2 Ubuntu, then symlinks them into place.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

log() { printf '\n\033[1;32m==>\033[0m %s\n' "$1"; }

log "Updating apt and installing packages"
sudo apt-get update
sudo apt-get install -y \
    zsh tmux git curl wget unzip build-essential \
    neovim ripgrep fd-find fzf zoxide \
    nodejs npm python3-pip clang-format zathura

# Debian/Ubuntu ships fd as `fdfind`; nvim/telescope expect `fd` on PATH.
mkdir -p "$HOME/.local/bin"
if ! command -v fd >/dev/null 2>&1 && command -v fdfind >/dev/null 2>&1; then
    ln -sf "$(command -v fdfind)" "$HOME/.local/bin/fd"
fi

log "Installing oh-my-zsh"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "oh-my-zsh already installed, skipping"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

log "Installing zsh-autosuggestions plugin"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions \
        "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions already installed, skipping"
fi

log "Installing powerlevel10k theme"
if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
        "$ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "powerlevel10k already installed, skipping"
fi

log "Fetching tmux plugin submodules (tpm, tmux-sessionist, minimal-tmux-status)"
git -C "$DOTFILES_DIR" submodule update --init --recursive

log "Creating symlinks"
link() {
    local src="$1" dest="$2"
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ] && [ "$(readlink -f "$dest")" = "$(readlink -f "$src")" ]; then
            echo "  $dest already linked, skipping"
            return
        fi
        echo "  $dest already exists, backing up to $dest.bak"
        mv "$dest" "$dest.bak"
    fi
    ln -s "$src" "$dest"
    echo "  linked $dest -> $src"
}

link "$DOTFILES_DIR/.zshrc"      "$HOME/.zshrc"
link "$DOTFILES_DIR/.p10k.zsh"   "$HOME/.p10k.zsh"
link "$DOTFILES_DIR/.tmux.conf"  "$HOME/.tmux.conf"
mkdir -p "$HOME/.tmux"
link "$DOTFILES_DIR/.tmux/plugins" "$HOME/.tmux/plugins"
mkdir -p "$HOME/.config"
link "$DOTFILES_DIR/nvim"        "$HOME/.config/nvim"

log "Installing tmux plugins via tpm"
"$HOME/.tmux/plugins/tpm/bin/install_plugins" || true

log "Setting zsh as default shell"
if [ "$SHELL" != "$(command -v zsh)" ]; then
    chsh -s "$(command -v zsh)" || echo "  could not chsh automatically, run: chsh -s $(command -v zsh)"
fi

cat <<'EOF'