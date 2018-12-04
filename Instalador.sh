#!/bin/bash
echo '[+] Iniciando o processo de instalação, porfavor aguarde'
sudo apt install aircrack-ng 1> /dev/null 2> /dev/stdout

local=`pwd`

sudo chmod +x DieHere.sh
sudo chmod +x Secundario.sh
sudo chmod +x Terciario.sh
sudo chmod +x Contador.sh
sudo chmod +x DieDown.sh

cp $local/Contador.sh /usr/bin/
cp $local/DieHere.sh /usr/bin/
cp $local/Secundario.sh /usr/bin/
cp $local/Terciario.sh /usr/bin/
cp $local/DieDown.sh /usr/bin/

ln -s /usr/bin/DieHere.sh /usr/bin/diehere
ln -s /usr/bin/DieDown.sh /usr/bin/diedown

sleep 2

echo '[+] O processo de instalação foi concluido!'
echo '[+] Para utilizar basta digitar o comando:$ diehere'
echo '[+] Esta pasta já não é mais nescessária e pode ser removida'
echo ' '
read -p "[-] Gostaria de remover esta pasta?...(S/N): " -n1 Resp
echo ' '

if [ $Resp = 's' ];then
echo '[-] Removendo...'
rm ../DieHere-master.zip
rm -r $local
sleep 1
echo '[-] Arquivos removidos! Saindo...'
sleep 1
echo ' '
echo '[-] Porfavor reinicie seu terminal antes de executar a ferramenta!'

elif [ $Resp = 'S' ];then
echo '[-] Removendo...'
rm ../DieHere-master.zip
rm -r $local
sleep 1
echo '[-] Arquivos removidos! Saindo...'
sleep 1
echo ' '
echo '[-] Porfavor reinicie seu terminal antes de executar a ferramenta!'

else
echo '[-] Arquivos foram matidos!'
sleep 1
echo ' '
echo '[-] Porfavor reinicie seu terminal antes de executar a ferramenta!'

fi
