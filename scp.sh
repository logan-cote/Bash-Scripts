#!/bin/bash
hosts=(
127.0.0.1
10.0.2.15
)
usage="Usage: ./scp.sh local/file/location remote/file/location"
if [ "$1" = "-h" ]; then
	echo $usage;
	exit
elif [ "$1" = "" ]; then
	echo $usage;
	exit
elif [ "$2" = "" ]; then
	echo $usage;
	exit
fi

username='kali'
local_path=$1
remote_path=$2

for host in ${hosts[@]}
do
	scp -o StrictHostKeyChecking=no $local_path $username@$host:$remote_path;
	echo "";
	ssh -o StrictHostKeyChecking=no $username@$host -t sudo rm -r $remote_path/list.txt;
	echo"";
done
exit
