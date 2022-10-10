#!/bin/bash
file=apache_logs.txt
echo "****************"
echo "IP more requests"
cat $file | awk '{print $1}' | sort | uniq -c | sort -gr | head -1
echo "****************"
echo "Most requested page"
cat $file | awk '{print $7}' | sort | uniq -c | sort -gr | head -1
echo "****************"
echo "Requests from each IP"
cat $file | awk '{print $1}' | sort | uniq -c | sort -gr 
echo "****************"
echo "Non existing pages"
cat $file | grep error404| awk '{print $15}'| sort
echo "****************"
echo "Time with more requests"
cat apache_logs.txt | awk '{print $4}'| awk -F '[/:]' '{print $4 ": "$5} '| uniq -c |sort -gr | awk '{print $2 $3}'| head -1
echo "****************"
echo "Search bots access to site"
cat $file | grep -i  bot\/ | awk '{print $1 $2  $14}' | uniq -c| sort -gr
echo "****************"