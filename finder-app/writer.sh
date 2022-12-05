#!/bin/sh

if [ $# != 2 ]
then
	echo "Invalid number of arguments passed, $#"
	exit 1
fi

writefile=$(basename $1)
writedir=$(dirname $1)
writestr=$2


if [ ! -d $writedir ]
then
	mkdir -p $writedir > /dev/null 2>&1

	if [ $? -ne 0 ]
	then
    		echo "Failed to create the directory, $writedir"
		exit 1
	fi
fi

touch $1

if [ ! -f $1 ]
then
	echo "Failed to create file, $writefile"
	exit 1
fi

echo $writestr > $1 

exit 0


