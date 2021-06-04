#!/bin/bash

bash folder.sh

if [ "$(ping -c 1 192.168.0.1)" ]
then
  echo "Hay conexión a internet" >> status.txt
  arr=(~/Documentos/*.png)
  echo "Se enviará la imagen ${arr[0]} encriptada al pc." >> status.txt
  openssl enc -aes-256-cbc -salt -in ${arr[0]} -out file.enc -pass file:./Documentos/aesKey.txt
  scp ./file.enc andrea@192.168.0.6:/home/andrea/Proyecto
  rm -f ${arr[0]}
else
  echo "No hay conexión a internet" >> status.txt
fi
