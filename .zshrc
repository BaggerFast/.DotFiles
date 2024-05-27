# sudo apt install zsh & sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

export ZSH="$HOME/.oh-my-zsh"
export ZSH_CONFIG="$HOME/.config/zsh"
export ZSH_CACHE="$HOME/.cache/zsh"

# local vars
ANTIGEN="$ZSH_CONFIG/antigen.zsh"
HISTFILE="$ZSH_CACHE/.zsh_history"
EDITOR="nvim"


if [ ! -d "$HOME/.cache/zsh" ]; then
    mkdir -p $HOME/.cache/zsh
fi
export ZSH_COMPDUMP="$ZSH_CACHE/zcompdump-$HOST-$ZSH_VERSION"

if [ ! -f "$ZSH_CONFIG/private.zsh" ]; then
    touch $ZSH_CONFIG/private.zsh
fi

autoload add-zsh-hook

zstyle ':omz:update' mode auto

if ! test -f "$ANTIGEN"; then
    echo "Antigen downoload"
    curl -L git.io/antigen > "$ANTIGEN"
    echo "Success"
fi

source "$ANTIGEN"

if ! command -v starship &>/dev/null; then
  sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
fi

eval "$(starship init zsh)"

export STARSHIP_CONFIG="$ZSH_CONFIG/starship.toml"

setopt hist_ignore_dups

#antigen (https://github.com/unixorn/awesome-zsh-plugins)
antigen use oh-my-zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle systemd
antigen bundle sudo
antigen bundle BaggerFast/venv-auto-zsh --branch=main

antigen apply

# sources
source "$ZSH/oh-my-zsh.sh"
source "$ZSH_CONFIG/aliases/main.zsh"
source "$ZSH_CONFIG/private.zsh"

prompt_context() {}