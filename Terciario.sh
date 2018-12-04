#!/bin/bash
clear
echo ' '
echo '[+] Processando...'
echo ' '

sleep 15

TESTE2=`cat matar2.txt`
kill $TESTE2
rm matar2.txt


ULTIMAA=`sed -n '$=' ./mom2.txt`
ULA=$(($ULTIMAA-1))
ULB=$(($ULA-1))
ULC=$(($ULB-1))
ULD=$(($ULC-1))
ULE=$(($ULD-1))
ULF=$(($ULD-1))
ULG=$(($ULF-1))
ULH=$(($ULG-1))

cat mom2.txt | sed -n "$ULG p;$ULF p;$ULE p;$ULD p;$ULC p;$ULB p;$ULA p;$ULTIMAA p" | cut -c20-38

rm mom2.txt
