#!/bin/bash


sleep 7

TESTE=`cat matar.txt`

kill $TESTE
rm matar.txt
