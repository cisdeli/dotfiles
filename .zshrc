# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Themes
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# "robbyrussell" "awesomepanda"
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"

# Auto Update Behavior 
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins 
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
source $HOME/.p10k.zsh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8
bindkey '^ ' autosuggest-accept

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Aliases
alias python=python3
alias ls='ls -lah --color=auto'

# Setup
if grep -qEi "(Microsoft|WSL)" /proc/version; then
    source "$HOME/.cargo/env"
else
    # Intentionally left blank
fi
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export PATH="/snap/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(zoxide init --cmd cd zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# bun completions
[ -s "/home/cisdeli/.local/share/reflex/bun/_bun" ] && source "/home/cisdeli/.local/share/reflex/bun/_bun"

# bun
export BUN_INSTALL="$HOME/.local/share/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH=$PATH:/usr/local/go/bin

# Force X11 for GUI apps (fixes Open3D/OpenGL in WSL)
export DISPLAY=:0
export WAYLAND_DISPLAY=""
export GDK_BACKEND=x11
export QT_QPA_PLATFORM=xcb
