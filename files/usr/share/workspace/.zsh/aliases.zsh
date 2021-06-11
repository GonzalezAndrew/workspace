# Command aliases
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias back='cd $OLDPWD'
alias c='clear'
alias df='df -h -x squashfs -x tmpfs -x devtmpfs'
alias e="vim -O "
alias E="vim -o "
alias extip='curl icanhazip.com'
alias grep='grep --color=auto'
alias lsmount='mount |column -t'
alias ports='netstat -tulanp'
alias h='history -i 1'
alias history='history 1'
alias j='jobs -l'
alias speedtest='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -'
alias ssha='eval $(ssh-agent) && ssh-add'
alias svim='sudo vim'
alias tn='tmux new -s'
alias watch='watch -d'

if command -v colordiff > /dev/null 2>&1; then
    alias diff="colordiff -Nuar"
else
    alias diff="diff -Nuar"
fi

## get top process eating memory
alias mem5='ps auxf | sort -nr -k 4 | head -5'
alias mem10='ps auxf | sort -nr -k 4 | head -10'

## get top process eating cpu ##
alias cpu5='ps auxf | sort -nr -k 3 | head -5'
alias cpu10='ps auxf | sort -nr -k 3 | head -10'

## list largest directories (aka "ducks")
alias dir5='du -cksh * | sort -hr | head -n 5'
alias dir10='du -cksh * | sort -hr | head -n 10'

# Package management
if [ -f /usr/bin/apt ]; then
  alias update='sudo apt update'
  alias upgrade='sudo apt update && sudo apt dist-upgrade && sudo apt autoremove && sudo apt clean'
  alias install='sudo apt install'
fi
if [ -f /usr/bin/pacman ]; then
  alias update='sudo pacman -Syyy'
  alias upgrade='sudo pacman -Syu'
  alias install='sudo pacman -S'
fi


# Fun aliases 
alias fish="perl ~/.functions/perl/fish"