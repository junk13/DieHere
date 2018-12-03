#!/bin/bash

echo '		 ____  _      _   _               
		|  _ \(_) ___| | | | ___ _ __ ___ 
		| | | | |/ _ \ |_| |/ _ \ `__/ _ \
		| |_| | |  __/  _  |  __/ | |  __/
		|____/|_|\___|_| |_|\___|_|  \___|
'

echo '[ATENÇÃO] Porfavor, Antes de iniciar, MAXIMIZE o seu terminal!'
echo "[+]Já maximizou?... <ENTER> para continuar..."
read #pausa até que o ENTER seja pressionado
echo "[+]Processando..."

#Identificando a placa de rede wireless
PLACA=`ifconfig | grep w | cut -d ":" -f1`

#Alterando a placa de rede wireless para o modo monitor
ifconfig $PLACA down
iwconfig $PLACA mode monitor
ifconfig $PLACA up

sleep 1

#Código do diabo que demorei demais para conseguir chegar nele
./Secundario.sh & airodump-ng wlan0 > mom.txt 2>&1 | pgrep -f airodump-ng > matar.txt

#Apresentação das redes wi-fi disponiveis
cat mom.txt | cut -c1-19,74-90

read -p '[+] Digite o nome da rede wifi alvo: ' REDEALVO
echo '[+] Você digitiou '$REDEALVO', Confirmar?...(S/N) ' ; read -n1 -s RESP

#Realização do ataque
if [ $RESP = 's' ];then
	echo '[+] Aguarde enquanto o ataque esta sendo realizado'






	rm mom.txt
	rm matar.txt
#Realização do ataque
elif [ $RESP = 'S' ];then
	echo '[+] Aguarde enquanto o ataque esta sendo realizado'
	


	



	rm mom.txt
	rm matar.txt
#Erro de escrita, Saindo
else
	echo '[+] Saindo...'
	rm mom.txt
	rm matar.txt
fi
