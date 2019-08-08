#!/bin/bash

# Instalar o Rdesktop

#		sudo pacman -S rdesktop

# Parâmetros do Rdesktop

#		-a 16 -z -a 16 -z -g 800x600
# 		-f para tela cheia
#		-a 16 -z -g para definir resolução da tela 800x600, 1024x768, etc.
#		-a para definir resolução da imagem em bits: 8, 16, 24
#		-d domínio da rede utilizada
#		-5 -u nome do usuário a utilizar
#		-p senha do usuário informado
#		-k para o teclado: pt-br ou en-5 -us
#		-r redirecionamento de pasta
#		-z = ativar compressão rdp
# 		https://linux.die.net/man/1/rdesktop
#Para mais parâmetros

# 		man rdesktop

echo "Digite (1) Local (2) Remoto: "

read resposta

if [ $resposta == 1 ]; then
	echo "Digite (C) Comercial ALP (J) João Nunes (P) ServerPDV (E) ServerERP: "
	read escolha

	case "$escolha" in
	c | C | "")
		rdesktop 192.168.1.103:33898 -a 16 -z -g 1366x768 -PKD -5 -u Halisson -k pt-br -p Team152014 -r disk:Documents=/home/halisson/Pasta\ remota
		;;
	j | J)
		rdesktop joaonunes.ddns.net -a 16 -z -g 1366x768 -PKD -5 -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
		;;
	p | P)
		rdesktop 192.168.1.103:33898 -a 16 -z -g 1366x768 -PKD -5 -u Administrador -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
		;;
	e | E)
		rdesktop 192.168.1.118:3300 -a 16 -z -g 1366x768 -PKD -5 -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
		;;
	*)
		echo "Opção inválida"
		;;
	esac

elif [ $resposta == 2 ]; then

	echo "Digite (C) Comercial ALP (J) João Nunes (E) ServidorERP: "

	read escolha

	case "$escolha" in
	c | C | "")
		rdesktop antonioleno.ddns.net:33898 -a 16 -z -g 1366x768 -PKD -5 -u Halisson -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
		;;

	j | J | "")
		rdesktop joaonunes.ddns.net -a 16 -z -g 1366x768 -PKD -5 -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
		;;

	e | E | "")
		rdesktop antonioleno.ddns.net:3300 -a 16 -z -g 1366x768 -PKD -5 -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
		;;

	*)
		echo "Opção inválida"
		;;
	esac

else
	echo "O valor fornecido é inválido!"
fi
