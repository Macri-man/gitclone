#!/bin/bash

function exists() {
	local url=$@
	wget -O/dev/null -q $url
	return $?
}

outfile="$PWD/$2"
if [ -f $outfile ]; then
	rm $outfile
fi
touch $outfile

for stu in $(cat $1); do
	echo "Student: $stu"
	mkdir -p $stu
	pushd $stu > /dev/null
	for lab in CS452-LAB{1..4} CS452-PROJECT{1}; do
		url="https://github.com/$stu/$lab.git"
		if ! exists $url; then
			echo "ERROR: $stu has not completed $lab"
			echo "$stu $lab" >> $outfile
			continue
		fi
		
		if [ -d $lab ]; then
			echo "Pull Lab: $lab"
			pushd $lab > /dev/null
				git pull 
			popd > /dev/null
		else
			echo "Clone Lab: $lab"
			git clone $url
		fi
	done
	popd > /dev/null
done

exit 0
