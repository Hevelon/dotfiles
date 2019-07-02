#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

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
    sudo pacman -S --needed alsa-utils arc-gtk-theme arc-icon-theme compton dunst feh gtk-engine-murrine gtk-engines gvfs i3-gaps maim mplayer networkmanager notify-osd playerctl pulseaudio pulseaudio-alsa rofi slim termite thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman ttf-dejavu tumbler xorg-server xorg-xinit xorg-xprop xorg-xrandr ttf-fira-sans ttf-fira-mono expac git jshon wget libcurl-gnutls ffmpeg file-roller ;
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
    trizen -S --needed google-chrome light polybar i3lock-fancy-git --noconfirm ;
    echo "< ================================================================= >";

if pergunta "== > INSTALAR PACOTES OPCIONAIS? ESTES PACOTES TRARÃO ALGUMAS FERRAMENTAS ADICIONAIS." S; then
    sudo pacman -S --needed blender gimp inkscape rawtherapee mplayer steam thunderbird libreoffice-fresh libreoffice-fresh-pt-br leafpad pavucontrol neofetch ;
    trizen -S --needed visual-studio-code-bin spotify-stable telegram-desktop cava gtop --noconfirm ;
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

echo -e "\e[44;90m== > Download :: Iniciado.\e[0m"
    cd ;
 #   sudo rm -dR dotfiles ;
    git clone https://github.com/Hevelon/dotfiles.git | exit ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Diretório :: Acessado.\e[0m"
    cd dotfiles ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Permissão para scripts :: Fornecidas.\e[0m"
    chmod +x scripts/* ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Medidas protetivas :: Iniciadas.\e[0m"
    rm -dR $HOME/.config/{background,compton,dunst,i3,neofetch,polybar,rofi,scripts,sons} ;
    rm -dR $HOME/.gtkrc-2.0 ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Instalação de arquivos :: Finalizada.\e[0m"
    cp -r {background,compton,dunst,i3,neofetch,polybar,rofi,scripts,sons} $HOME/.config ;
    cp -r .gtkrc-2.0 $HOME ;
    cp -r .fonts,termite,.bashrc $HOME ;
    echo "< ================================================================= >";

echo -e "\e[44;90m== > Instalação de arquivos com requisição de senha :: Finalizada.\e[0m"
    sudo rm -dR /etc/xdg/termite ;
    sudo cp -r termite /etc/xdg ;
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
