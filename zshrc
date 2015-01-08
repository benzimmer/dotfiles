source $HOME/Dropbox/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES

git

osx
brew

heroku

fasd

tmuxinator

# Guess what to install when running an unknown command.
command-not-found

# Helper for extracting different types of archives.
extract

# ZSH port of Fish shell's history search feature.
zsh-users/zsh-history-substring-search


# Syntax highlighting bundle.
zsh-users/zsh-syntax-highlighting

EOBUNDLES

# Load the theme.
antigen theme ys

# Tell antigen that you're done.
antigen apply

alias vim="/Users/ben/Applications/MacVim.app/Contents/MacOS/Vim"

export EDITOR="vim"

# Aliases
##
alias __='vim ~/.zshrc'
alias ___='source ~/.zshrc'
alias v__='vim ~/.vimrc'
alias t__='vim ~/.tmux.conf'

## vim
alias v='vim'

## fasd
alias j='z'

## tmux
alias t='tmux -u'
alias ta='tmux -u attach -t'
alias tls='tmux ls'
alias tx='tmuxinator'
alias txl='tmuxinator list'

txe () { vim ~/.tmuxinator/$1.yml }

#export GIT=/usr/local/bin/git
## git
alias git="nocorrect git"
alias gx='gitx'

## ssh stuff
alias weg='killall ssh'
alias vssh="vim ~/.ssh/config"

## infopark aliases
alias ses='ssh -N -f webcms'
alias proxy='ssh -N -f -D 1081 support'
alias hannre.dev='ssh -N -f support-hannre; ssh -N -f hannre-dev;'
alias hannre.prep='ssh -N -f support-hannre; ssh -N -f hannre-prep; ssh -N -f hannre-prep-db;'
alias hannre.prod='ssh -N -f support-hannre; ssh -N -f hannre-prod; ssh -N -f hannre-prod-db;'

## misc
alias a="ack"
alias pg="ps aux | grep"
alias ssh="nocorrect ssh"
alias bundle="nocorrect bundle"

# rails
alias rp="rails server -p"
alias rc="rails console"
alias be="bundle exec"
alias ber="bundle exec rake"

alias sr="bundle exec bin/rails"
alias sra="bundle exec bin/rake"
alias spr="bundle exec bin/spring"
alias srs="bundle exec bin/rspec"

# Directories
hash -d dl=~/Downloads
hash -d dev=~/Google\ Drive/Development

hash -d ip=~/dev/infopark

[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

### Added by the Heroku Toolbelt
#export PATH="/usr/local/heroku/bin:$PATH"

export LC_ALL="de_DE.UTF-8"

export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
export PATH=/Applications/Postgres93.app/Contents/MacOS/bin:$PATH
export PATH=/usr/local/mysql/bin:$PATH
eval "$(rbenv init -)"
eval "$($HOME/.scc/bin/scc init -)"
eval "$(/Users/ben/dev/private/bee/bin/bee init -)"

# node module paths
export PATH="/usr/local/share/npm/bin:$PATH"

export HOMEBREW_GITHUB_API_TOKEN=fc56675ff133ee21b438a5f1c56ecb8bca263067
export RBENV_ROOT=$HOME/.rbenv

export GOPATH=$HOME/.go

gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 791x347\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 791x347 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

# added by travis gem
[ -f /Users/ben/.travis/travis.sh ] && source /Users/ben/.travis/travis.sh

pt() {
  peerflix "$1" --vlc
}
