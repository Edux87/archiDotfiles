#!/bin/bash
# ~/.bash_aliases

#aliases for git

alias gam='echo " > git commit -am" && git commit -am '
alias grm='git rm'
alias gmv='git mv'
alias grr='git reset --hard HEAD'
alias goop='git commit --amend -C HEAD -n'
alias ga='git add'
alias gp='git pull'
alias gpu='echo " > git push " && git push'
alias gl='git log --name-status'
alias gs='echo " > git status" && git status'
alias gf='echo " > git fetch -p" &&  git fetch -p'
alias gm='git commit -m'
alias gb='echo " > git branch" && git branch'
alias gbr='echo " > git branch -r" && git branch -r'
alias gcb='echo "git checkout -b" && git checkout -b'
alias gc='git checkout'
alias gac='echo " > git add .; git commit -am " && git add .; git commit -am '
alias gpo='echo " > " && git pull origin '
alias gpuo='echo " > git push origin " && git push origin '
alias gpom='echo " > git pull origin master" && git pull origin master'
alias gpuom='echo " > git push origin master" && git push origin master'
alias gpod='git pull origin development'
alias gpuod='git push origin development'
alias gpor='git pull origin releases'
alias gpuor='git push origin releases'
alias gcm='git checkout master'
alias gcr='git checkout releases'
alias gcd='git checkout development'
alias gch='git checkout hotfix'
alias gcp='git checkout pre'
alias gmh='git merge hotfix'
alias gmd='git merge development'
alias gmr='git merge releases'
alias gmm='git merge master'
alias gff='git fetch -p && git rebase origin/\$(just_git_branch)'
alias gls='git log --pretty=format:"%C(reset)%h %C(yellow)%ad%C(yellow)%d %C(reset)%s%C(green) [%cn]" --decorate --date=short'
alias gclone='echo " > git clone " && git clone '
alias gcount='echo " > git shortlog -s -n --all" && git shortlog -s -n --all'
alias gla='echo " > git log --author" && git log --author '

# alises for off/reset of linux system
alias off='sudo halt'
alias reset='sudo reboot'

# Resstart Services
function restart() {
echo " > sudo service $1 restart"
sudo service $1 restart
}

# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"

# network
alias redes='nmcli r'
alias devices='nmcli dev'
alias conectar='nmcli r wifi on'
alias desconectar='nmcli r wifi off'

function wifi() {
   nmcli dev wifi connect $1 password $2 
}

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

#Utils#
alias szsh='source ~/.zshrc'
alias ebal='sudo vim ~/.bash_aliases'
alias cls='clear'

#Reload zsh
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias zshrc="vim ~/.zshrc && reload"

#Alias Folders
alias proyectos="cd ~/proyectos"
alias prova="cd ~/proyectos/vagrant"
alias prodo="cd ~/proyectos/docker"

#Tmux
alias tmuxdev='~/dotfilesDev/tmux/tmuxdev'
