#!/bin/bash
#chmod +x gitrm.sh 

export IFS="$(echo -en '\n\b')"
for item in $(cat $1); do
	export IFS="$(echo -en ' \n\b') "
	set -- $item
	stu=$1
	account=$2
	export IFS="$(echo -en '\n\b')"
	echo "Student: $stu :: $account"
	rm -rf $stu
done

exit 0
