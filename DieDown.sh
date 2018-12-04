#!/bin/bash

PLACA3=`ifconfig | grep w | cut -d ":" -f1`

airmon-ng stop $PLACA3 > /del/null 2>&1
echo ' '
echo '[+] Você já pode acessar a internet normalmente !'
echo ' '
