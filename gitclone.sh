#!/bin/bash
#read clonenames into a array
#append name of repo onto git clone 
#make directory of of name of person 
#execute git clone
#repeat until end of array

declare -a array
exec 10<&0
exec<$1
let count=0

while read LINE; do
	ARRAY[$count]=$LINE
	((count++))
done

echo Number of elements :${#ARRAY[@]}
echo ${ARRAY[@]}
exec 0<&10 10<&-

ARRAY2=(CS452-LAB1 CS452-LAB2 CS452-LAB3 CS452-LAB4)

COUNT=${#ARRAY[@]}
NUMLAB=0

while [ $COUNT -gt 0 ]; do
	mkdir $ARRAY
	echo $ARRAY
	until [ $NUMLAB -gt 3 ]; do
	echo $NUMLAB
	echo $ARRAY
	echo $ARRAY2
		git clone https://github.com/$ARRAY/$ARRAY2.git
		let NUMLAB=NUMLAB+1
	done
	cd ..
	let COUNT=COUNT-1
done
