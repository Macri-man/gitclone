#!/bin/bash
# to execute ./gitclone.sh clonenames.txt not_finished.txt

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

N=2
export IFS="$(echo -en '\n\b')"
for item in $(cat $1); do
	export IFS="$(echo -en ' \n\b') "
	set -- $item
	stu=$1
	account=$2
	export IFS="$(echo -en '\n\b')"
	echo "Student: $stu :: $account"
	mkdir -p $stu
	pushd $stu > /dev/null
	for lab in CS452-LAB{1..4} CS452-PROJECT1; do
<<<<<<< HEAD
		url="https://github.com/$account/$lab.git"
=======
		url="https://github.com/$stu/$lab.git"
>>>>>>> 743416a91c61dbc1addf464e90f8501402ca02aa
		if ! exists $url; then
			echo "ERROR: $stu with user-name $account has not forked $lab"
			echo "$stu with user-name $account has not forked $lab" >> $outfile
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
