# ls
alias ls='ls -hF --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF'
alias ll='ls -a --color=auto --format=long'

# grep
alias grep='grep --color=auto'

# IP
alias myip="echo $(dig +short myip.opendns.com @resolver1.opendns.com)"

# update
alias upgrade-all='sudo apt update && sudo apt upgrade && flatpak update'

# tar
alias compress="tar -zcvf"
alias decompress="tar -zxvf"

# touch
alias ouch="touch"

# ss
alias ports="ss -tulpn"
