#!/bin/bash
#notify-send "Hola $USER, vamos a comenzar ..."

cd ~

function log {
    notify-send "$1" 'archiDotfiles1.0' --icon=dialog-information
}

function pac {
    sudo pacman -S "$1" --noconfirm
}


if [ ! -x /usr/bin/dkms ] ; then                                
    log "Utility dkms"
    pac "dkms"
    sudo dkms autoinstall
fi

if [ ! -x /usr/bin/terminator ] ; then                                
    log "Instalando Terminator"
    pac "terminator"
fi

if [ ! -x /usr/bin/curl ] ; then                                
    log "Instalando Curl"
    pac "curl"
fi

if [ ! -x /usr/bin/emacs ] ; then                                
    log "Instalando Emacs"
    pac "emacs"
fi

if [ ! -x /usr/bin/ngrep ] ; then                                
    log "Instalando ngrep"
    pac "ngrep"
fi

if [ ! -x /usr/bin/vim ] ; then                                
    log "Instalando Vim"
    pac "vim"
fi


if [ ! -x /usr/bin/zsh ] ; then                                
    log "Instalando Zsh"
    pac "zsh"
fi

if [ ! -f ~/.zshrc ]; then
    log "Configurando Terminal OhMyZsh"
    curl -L http://install.ohmyz.sh | sh
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
    chsh -s /bin/zsh $USER
fi

if [ ! -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]; then
    log "Plugins para Zsh - syntax.highligh"
    cd ~/.oh-my-zsh/custom/plugins
    git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
    log "Creando enlaces simbolicos"
    rm -rf ~/.zshrc
    ln -s ~/archiDotfiles/config/.bash_aliases ~/.bash_aliases
    ln -s ~/archiDotfiles/config/.zshrc ~/.zshrc
fi


if [ ! -x /usr/bin/virtualbox ] ; then                                
    log "Instalando VirtualBox"
    pac "virtualbox"
    pac "linux318-virtualbox-host-modules-5.0.0-1"
    sudo systemctl enable dkms.service
    sudo dkms autoinstall
    pac "virtualbox-guest-utils"
    
fi

#Carpeta de Proyectos Vagrant

if [ ! -d ~/proyectos ]; then
    mkdir -p ~/proyectos/vagrant/proyectos.dev/public
    cp ~/archiDotfiles/config/Vagrantfile ~/proyectos/vagrant
    cp ~/archiDotfiles/config/index.php ~/proyectos/vagrant/proyectos.dev/public
    #sed -i "192.168.33.10 proyectos.dev proyectos" /etc/hosts
    log "Agregando Host para Proyectos www.proyectos.dev"
fi

#Carpeta de Proyectos Docker

if [ ! -x /usr/bin/vagrant ] ; then   
    log "Instalando Vagrant"
    pac "vagrant"
    vagrant plugin install vagrant-hostmanager
    vagrant box add scotch/box
    vagrant box list
fi

if [ ! -d ~/.netbeans ]; then
    log "Instalando NetBeans8"
    sudo apt-get autoremove
    wget -O ~/netbeans.sh http://download.netbeans.org/netbeans/8.0.2/final/bundles/netbeans-8.0.2-php-linux.sh
    sudo chmod +x ~/netbeans.sh
    bash ~/netbeans.sh
fi

if [ ! -x /usr/bin/tmux ] ; then                                
    log "Instalando tmux"
    pac "tmux"
    rm -rf ~/.tmux.conf
    ln -s ~/archiDotfiles/config/.tmux.conf ~/.tmux.conf
fi

log "Finalizado"
