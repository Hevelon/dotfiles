#!/usr/bin/env bash

escolha=$(echo -e "-Bloquear\n-Sair\n-Suspender\n-Reiniciar\n-Desligar" | rofi -dmenu -p "Controle de energia" -bw 0 -lines 5 -separator-style none -location 0 -width 16 -hide-scrollbar -padding 5)
if [ ! -z $escolha ]; then
	case $escolha in
	-Bloquear)
		$HOME/.config/scripts/./bloqueio.sh
		;;
	-Sair)
		i3-msg exit
		;;
	-Suspender)
		systemctl suspend
		;;
	-Reiniciar)
		systemctl reboot
		;;
	-Desligar)
		systemctl poweroff
		;;
	*)
		echo "Opção inválida"
		;;
	esac
fi
