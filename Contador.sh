#!/bin/bash

#Contador
TEMPOS=0
for (( loop=0;loop=1000;loop++ )) do
			TEMPOS=$(($TEMPOS+1))				
			clear
			echo '[ATENÇÃO] O ataque está sendo realizado!'
			echo ' '
			echo '[+] Para interromper pressione ( Ctrl + C )'
			echo ' '
			echo $TEMPOS's'
			echo ' '
			sleep 1
			clear
		done