#!/bin/bash
function adress {
arp -a
}
function port {
	ss -tlpn
}
echo -n  "Please input key: "
read key
if [ $key == '--all' ]  
then
	arp
elif
	[ $key == '--target' ]
then
	port
else 
	echo "Please input --all or input --target"
fi