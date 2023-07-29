#!/bin/bash
hosts=(
127.0.0.1
10.0.2.15
)
username='kali'
local_path='/home/kali/Desktop/list.txt'
remote_path='/home/kali/'

for host in ${hosts[@]}
do
	scp -o StrictHostKeyChecking=no $local_path $username@$host:$remote_path;
	ssh -o StrictHostKeyChecking=no $username@$host -t sudo rm -r $remote_path/list.txt
done
