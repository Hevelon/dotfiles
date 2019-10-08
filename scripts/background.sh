#!/usr/bin/env bash

################ Aplicando Wallpaper de acordo com a hora
HORA=$(date "+%k")
    if ((HORA >= 20 )); then
        feh --randomize  --bg-tile $HOME/.config/background/Noite.png ;

    elif ((HORA >= 6 )); then
        feh --randomize  --bg-tile $HOME/.config/background/Dia.jpg ;

    else
        feh --randomize  --bg-tile $HOME/.config/background/Noite.jpg ;
fi 
sleep 60m ;
done
