OS_SYSTEM=$(uname -o)

if [[ "$OS_SYSTEM" == "Darwin" ]]; then
    alias b="brew"
    alias reload8000="sudo lsof -t -i tcp:8000 | xargs kill -9"
fi

if [[ "$OS_SYSTEM" == "GNU/Linux" ]]; then

    LSB_DISTRIBUTOR=$(lsb_release -i -s)

    if [[ "$LSB_DISTRIBUTOR" == "Debian" ]]; then
        alias upd="sudo apt-get update & sudo apt-get upgrade"
    fi
fi


alias pir="pip install -r requirements.txt"
alias pupg="python3 -m pip install --upgrade pip"

alias mkv="python3.10 -m venv venv"
alias vrun="source venv/bin/activate"
alias vfull="mkv && vrun && pupg && pir"

alias pmmg="python manage.py makemigrations"
alias pmm="python manage.py migrate"

# shell
alias cls="clear"
alias ls="exa --icons"
