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

#Para mais parâmetros

# 		man rdesktop

echo "Digite (1) Comercial (2) João Nunes (3) ServerPDV (4) ServerERP: "

read resposta 


if [ $resposta == 1 ];
then

	 rdesktop 192.168.1.103 -g 1366x768 -PKD -u Halisson -r disk:Documents=/home/halisson/Pasta\ remota

elif [ $resposta == 2 ]
then

	 rdesktop joaonunes.ddns.net -g 1366x768 -PKD -u Administrator -r disk:Documents=/home/halisson/Pasta\ remota

elif [ $resposta == 3 ]
then
	rdesktop 192.168.1.103 -g 1366x768 -PKD -u Administrador -r disk:Documents=/home/halisson/Pasta\ remota

elif [ $resposta == 4 ]
then
    rdesktop 192.168.1.118 -g 1366x768 -PKD -u Administrator -r disk:Documents=/home/halisson/Pasta\ remota

else
    echo "O valor fornecido é inválido!"
fi