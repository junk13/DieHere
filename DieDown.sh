#!/bin/bash

PLACA3=`ifconfig | grep w | cut -d ":" -f1`

sleep 1

airmon-ng stop $PLACA3 > /dev/null

echo ' '
echo '[+] Você já pode acessar a internet normalmente !'
echo ' '
