if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
export CONFIG="$HOME/.config/zsh"

touch "$CONFIG/private.zsh" # for private configuration

autoload add-zsh-hook

ZSH_THEME="powerlevel10k/powerlevel10k"

zstyle ':omz:update' mode auto      # update automatically without asking

plugins=(
    sudo
    venv-auto-zsh
    systemd
    zsh-syntax-highlighting
    copyfile
    copypath
)


# sources

source $ZSH/oh-my-zsh.sh
source $CONFIG/aliases.zsh

prompt_context() {}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
