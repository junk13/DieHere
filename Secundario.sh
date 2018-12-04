#!/bin/bash


sleep 6

TESTE=`cat matar.txt`

kill $TESTE
rm matar.txt
