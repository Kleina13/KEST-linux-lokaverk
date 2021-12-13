#!bin/bash
name=Backup_&(date +&F)
cp -r /home /tmp/$name && tar z /tmp/$name 
