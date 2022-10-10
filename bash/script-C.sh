#!/bin/bash
echo "------------------------------------------"
echo "Copy files from original dir to backup dir"
echo "------------------------------------------"
echo -n "Enter path to original dir: "
read original_dir
echo "------------------------------------------"
echo -n "Enter path to backup dir: "
read backup_dir
echo "------------------------------------------"
#-----Check--directories--------------------------
#---check-original--
[ -d $original_dir ] && echo "OK: $original_dir found." || { echo "ERROR: $original_dir not found. Exit."; exit 1; }
#----check-backup--
[ -d $backup_dir ] && echo "OK: $backup_dir found." || { echo "ERROR: $backup_dir not found. Exit."; exit 1; }
#---------reate-backup------------------------
log=/tmp/backup_dir.log
 rsync -avz --delete  --progress  /home/davig/1/ /home/davig/2/ >> $log
echo "------------------------------------------"
echo "See log file in $log"
#---------promt-after-start-crontab--------
echo "------------------------------------------"
echo -n "You want to add to crontab? Type yes/no: "
read answer
if [ $answer = 'yes' ] 
then 

echo "* * * * *	(date; rsync -avz --delete  --progress  $original_dir $backup_dir) >> $log "| crontab -
echo " In Crontab added: `crontab -l`"
else
	echo "Dont added to crontab"

fi