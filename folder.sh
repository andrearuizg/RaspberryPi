#!/bin/bash

# 1GB
SIZE="1"

# check the current size
CHECK="$(du -BM -hs ./Documentos)"
CHECK=${CHECK%G*}
echo "Current Foldersize: $CHECK GB"

if [ $(echo "$CHECK > $SIZE" |bc -l) ]
then
	arr=(~/Proyecto/*.png)
	echo "${arr[0]}"
	#python3 predict.py ${arr[0]}
	cp ${arr[0]} /home/pi/Documentos
	sleep 1
	rm ${arr[0]}
fi
