HISTFILESIZE=10000000
HISTSIZE=10000000

alias updatewww='rsync -avz -e ssh ~/Dropbox/corey.io/ corey.io:/data/www/'
alias ls='ls -alGh'
alias rmswp='find ./ -type f -name "\.*sw[klmnop]" -delete'
alias fc='find . -xdev -type f | cut -d "/" -f 2 | sort | uniq -c | sort -n'

# prints out only the ip addresses
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'

today() {
    cwd=$(pwd)
    cd ~/Dropbox/Notes/daily/
    touch ~/Dropbox/Notes/daily/$(date +%Y-%m-%d).txt
    mvim ~/Dropbox/Notes/daily/$(date +%Y-%m-%d).txt
    cd $cwd
}
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export PATH="$HOME/.yarn/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.cargo/bin:$PATH"

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export PATH=~/.local/bin:$PATH
export PATH=~/Library/Python/3.6/bin:$PATH
