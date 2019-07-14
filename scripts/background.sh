#!/usr/bin/env bash
# www.jirrezdex.com
# contato@jirrezdex.com
# Jirrez Matheus

################ Aplicando Wallpaper de acordo com a hora
HORA=$(date "+%k")
    if ((HORA >= 20 )); then
        feh --bg-tile $HOME/.config/background/Noite.png ;
        #DISPLAY=:0.0 feh --bg-scale $HOME/.config/background/Noite.png ;
    elif ((HORA >= 6 )); then
        #feh --bg-tile $HOME/.config/background/Dia.jpg ;
        DISPLAY=:0.0 feh --bg-scale $HOME/.config/background/Dia.jpg ;
    else
        DISPLAY=:0.0 feh --bg-scale $HOME/.config/background/Noite.jpg ;
fi 
sleep 60m ;
done
