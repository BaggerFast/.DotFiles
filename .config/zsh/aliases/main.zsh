# python
alias pir="pip install -r requirements.txt"

# shell
alias cls="clear"
alias ls="eza --icons -s type"

# utils
alias d="docker"
alias g="git"

ALIASES="$ZSH_CONFIG/aliases"

if [[ "$OSTYPE" == "darwin"* ]]; then
    source "$ALIASES/darwin.zsh"
elif [[ "$OSTYPE" == "linux"* ]]; then
    LSB_DISTRIBUTOR=$(lsb_release -i -s)
    if [[ "$LSB_DISTRIBUTOR" == "Debian" ]]; then
        source "$ALIASES/debian.zsh"
    fi
fi
