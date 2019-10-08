#!/usr/bin/env bash


pergunta() {
    local prompt default reply
    while true; do
        if [ "${2:-}" = "Y" ]; then
            prompt="S/N"
            default=S
        elif [ "${2:-}" = "N" ]; then
            prompt="S/N"
            default=N
        else
            prompt="S/N"
            default=
        fi
        echo -n "$1 [$prompt] "
        read reply </dev/tty
        if [ -z "$reply" ]; then
            reply=$default
        fi
        case "$reply" in
            [Ss]*) return 0  ;;
            [Nn]*) return  1 ;;
        esac
    done
}

echo -e "\e[44;90m== > Olá "$USER", Os arquivos estão sendo movidos para o diretório!\e[0m"
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Diretório do repositório :: Acessado.\e[0m"
    cd $HOME/dotfiles ;
    git pull ;

echo -e "\e[44;90m== > Medidas protetivas :: Iniciadas.\e[0m"
    sudo rm -dR {background,compton,dunst,i3,neofetch,polybar,rofi,scripts,sons,termite} ;

echo -e "\e[44;90m== > Arquivos :: Copiados.\e[0m"
    cp $HOME/.bashrc $HOME/dotfiles ;
    cp -r $HOME/.config/{background,compton,dunst,i3,neofetch,polybar,rofi,scripts,sons} $HOME/dotfiles ;
    sudo cp -r /etc/xdg/termite $HOME/dotfiles ;
    sudo cp -r /etc/X11/xorg.conf.d/10-monitor.conf $HOME/dotfiles ;

echo -e "\e[44;90m== > Preparação :: Concluída.\e[0m"
    notify-send "Preparação concluída" ;
    echo "< ================================================================= >";

if pergunta "== > Fazer upload para o gitHub?" S; then
    cd $HOME/dotfiles ;
    git add --all ;
    git commit ;
    git push -u origin master ;
    notify-send "Arquivos upados" ;
fi

canberra-gtk-play --file=$HOME/.config/sons/bip.wav