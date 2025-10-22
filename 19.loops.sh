#!/bin/bash

userid=$(id -u)

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

logfolder="/var/log/shell-script"
scriptname=$( echo $0 | cut -d "." -f1 )
logfile="$logfolder/$scriptname.log"

mkdir -p $logfolder
echo "script started excuted: $(date)"

if [ $userid -ne 0 ]; then
    echo -e "error::please run as sudo user"
    exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
      echo -e "installing $2 ... $r is failed $n"
      exit 1
  else
      echo -e "installing $2 ... $g is sucess $n"
  fi      
}

$@ #all packages

for package in $@
do
 echo "package is $@"
done