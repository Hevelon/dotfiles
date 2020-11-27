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
    
echo -e "\e[44;90m== > Olá "$USER". Iniciando instalação da última versão!\e[0m"
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Instalando pacotes essenciais.\e[0m"
    sudo pacman -S --needed feh i3-gaps maim thunar-archive-plugin thunar-media-tags-plugin thunar-volman ttf-dejavu tumbler ttf-fira-sans ttf-fira-mono expac jshon wget libcurl-gnutls ffmpeg file-roller gvfs gvfs-afc  gvfs-gphoto2 gvfs-mtp gvfs-smb ;
    echo "< ================================================================= >";

if pergunta "== > INSTALAR TRIZEN? CASO NÃO O TENHA ISTALADO, INSTALE!" S; then
    mkdir TRIZEN-DEX ;
    cd TRIZEN-DEX ;
    git clone https://aur.archlinux.org/trizen.git ;
    cd trizen ;
    makepkg -si ;
    cd .. ;
    cd .. ;
    sudo rm -dR TRIZEN-DEX ;
    echo "< ================================================================= >";
fi

echo -e "\e[44;90m== > Instalando pacotes essenciais com o TRIZEN.\e[0m"
    trizen -S --needed light polybar i3lock-fancy-git --noconfirm ;
    echo "< ================================================================= >";

if pergunta "== > INSTALAR PACOTES OPCIONAIS? ESTES PACOTES TRARÃO ALGUMAS FERRAMENTAS ADICIONAIS." S; then
    sudo pacman -S --needed  inkscape rawtherapee mplayer thunderbird libreoffice-fresh leafpad pavucontrol neofetch ;
    trizen -S --needed visual-studio-code-bin cava gtop ttf-font-awesome-4 ttf-font-awesome --noconfirm ;
    echo "< ================================================================= >";
fi

echo -e "\e[44;90m== > Habilitando o wireless.\e[0m"
    sudo systemctl enable NetworkManager.service ;
    sudo systemctl start NetworkManager ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Habilitando o slim.\e[0m"
    sudo systemctl enable slim.service ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Criando diretórios básicos :: Iniciado.\e[0m"
#   mkdir $HOME/{Documentos,Downloads,Imagens,Modelos,Músicas,Público,Vídeos} ;
    mkdir $HOME/Pictures/Screenshots ;
    mkdir $HOME/Videos/Screencasts ;
    mkdir $HOME/.config/spotifylog ;
    echo "< ================================================================= >";

########################################################################
echo -e "\e[44;90m== > Instalação de arquivos :: Finalizada.\e[0m"
    cp -r ~/dotfiles/ {background,compton,dunst,i3,neofetch,polybar,rofi,scripts,sons} $HOME/.config ;
# cp -r .gtkrc-2.0 $HOME ;
    cp -r ~/dotfiles/.fonts,termite,.bashrc,.xinitrc $HOME/ ;
# sudo cp -r 10-monitor.conf /etc/X11/xorg.conf.d/ ;
    echo "< ================================================================= >";

#echo -e "\e[44;90m== > Instalação de arquivos com requisição de senha :: Finalizada.\e[0m"
#    sudo rm -dR /etc/xdg/termite ;
#    sudo cp -r termite /etc/xdg ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Instalação de icones :: Finalizada.\e[0m"
    mkdir $HOME/.local/share/fonts ;
    cd fonts ;
    cp feather.ttf $HOME/.local/share/fonts ;
    cd .. ;
    echo "< ================================================================= >";

#echo -e "\e[44;90m== > Arquivos desnecessários :: Removidos.\e[0m"
#    cd .. ;
#    cd .. ;
#    sudo rm -dR ArchDex ;
#    echo "< ================================================================= >";

if pergunta "== > INICIAR REMOÇÃO DE ARQUIVOS PESSOAIS DO DESENVOLVEDOR? RECOMENDADO, PODE CAUSAR PROBELMAS EM OUTROS COMPUTADORES." S; then
    sudo rm -dR $HOME/.config/scripts/pessoal.sh ;
    echo "< ================================================================= >";
fi

echo -e "\e[44;90m== > Download :: Concluídas.\e[0m"
    i3-msg restart ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Script :: Finalizando.\e[0m"
    canberra-gtk-play --file=$HOME/.config/sons/bip.wav ;
