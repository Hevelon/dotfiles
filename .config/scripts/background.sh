#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

################ Aplicando Wallpaper de acordo com a hora
HORA=$(date "+%k")
    if ((HORA >= 20 )); then
        feh --bg-scale $HOME/.config/background/Noite.png ;
    elif ((HORA >= 6 )); then
        feh --bg-scale $HOME/.config/background/Dia.png ;
    else
        feh --bg-scale $HOME/.config/background/Noite.png ;
fi 
sleep 60m ;
done