#!/bin/bash

# Instalar o Rdesktop

#		sudo pacman -S rdesktop

# Parâmetros do Rdesktop

#		-a 16 -z -g 800x600
# 		-f para tela cheia
#		-g para definir resolução da tela 800x600, 1024x768, etc.
#		-a para definir resolução da imagem em bits: 8, 16, 24
#		-d domínio da rede utilizada
#		-u nome do usuário a utilizar
#		-p senha do usuário informado
#		-k para o teclado: pt-br ou en-us
#		-r redirecionamento de pasta
#		-z = ativar compressão rdp
# 		https://linux.die.net/man/1/rdesktop
#Para mais parâmetros

# 		man rdesktop

echo "Digite (1) Local (2) Remoto: "

read resposta

if [ $resposta == 1 ]; then
	echo "Digite (1) Comercial (2) João Nunes (3) ServerPDV (4) ServerERP: "
	read escolha
	if [ $escolha == 1 ]; then
		rdesktop 192.168.1.103:33898 -g 1366x768 -PKD -k pt-br -5 -u Halisson -k pt-br -p Team152014 -r disk:Documents=/home/halisson/Pasta\ remota

	elif [ $escolha == 2 ]; then
		rdesktop joaonunes.ddns.net -g 1366x768 -PKD -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota

	elif [ $escolha == 3 ]; then
		rdesktop 192.168.1.103:33898 -g 1366x768 -PKD -u Administrador -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
	elif [ $escolha == 4 ]; then
		rdesktop 192.168.1.118:3300 -g 1366x768 -PKD -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
	else
		echo "O valor fornecido é inválido!"
	fi

elif [ $resposta == 2 ]; then

	echo "Digite (1) Comercial (2) João Nunes: "

	read escolha2
	if [ $escolha2 == 1 ]; then
		rdesktop antonioleno.ddns.net:33898 -g 1366x768 -PKD -u Halisson -k pt-br -p Team152014 -r disk:Documents=/home/halisson/Pasta\ remota

	elif [ $escolha2 == 2 ]; then
		rdesktop joaonunes.ddns.net -g 1366x768 -PKD -u Administrator -k pt-br -r disk:Documents=/home/halisson/Pasta\ remota
	else
		echo "O valor fornecido é inválido!"
	fi

else
	echo "O valor fornecido é inválido!"
fi
