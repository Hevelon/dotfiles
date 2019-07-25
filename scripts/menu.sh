#!/usr/bin/env bash


res=$(echo "-Atualizar;-Background;-Controle" | rofi -sep ";" -dmenu -p "Arch Dex" -bw 0 -lines 3 -separator-style none -location 0 -width 16 -hide-scrollbar -padding 5)
if [ ! -z $res ]; then
	case $res in
    	-Atualizar)
			termite -e $HOME/.config/scripts/archdex.sh ;
		;;

		-Background)
			escolha=$(echo -e "-Dia\n-Noite" | rofi -dmenu -p "Selecionar wallpaper" -bw 0 -lines 2 -separator-style none -location 0 -width 16 -hide-scrollbar -padding 5)
			[ $escolha = "-Dia" ] && feh --bg-scale $HOME/.config/background/Dia.png ;
			[ $escolha = "-Noite" ] && feh --bg-scale $HOME/.config/background/Noite.png ;
		;;

		-Controle)
			escolha=$(echo -e "-Bloquear\n-Sair\n-Suspender\n-Reiniciar\n-Desligar" | rofi -dmenu -p "Controle de energia" -bw 0 -lines 5 -separator-style none -location 0 -width 16 -hide-scrollbar -padding 5)
			[ $escolha = "-Bloquear" ] && $HOME/.config/scripts/./bloqueio.sh
			[ $escolha = "-Sair" ] && i3-msg exit
			[ $escolha = "-Suspender" ] && systemctl suspend
			[ $escolha = "-Reiniciar" ] && systemctl reboot
			[ $escolha = "-Desligar" ] && systemctl poweroff
		;;
	esac
fi
