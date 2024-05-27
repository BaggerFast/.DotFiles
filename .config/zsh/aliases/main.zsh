# python
alias mkv="python3.10 -m venv venv"
alias vrun="source venv/bin/activate"
alias vfull="mkv && vrun && pupg && pir"
alias pir="pip install -r requirements.txt"
alias pupg="python3 -m pip install --upgrade pip"

# js
alias js="pnpm"

# shell
alias cls="clear"
alias vi="nvim"
alias ls="exa --icons -s type"

# utils
alias dock="docker"
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
