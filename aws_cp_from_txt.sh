#!/bin/bash  
set -e  
while read line  
do  
  aws s3 cp $line <DESTINATION_FOLDER>
done <filenames.txt
