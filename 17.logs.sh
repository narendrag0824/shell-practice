#!/bin/bash

userid=$(id -u)

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

logfolder="/vim/log/shell-script"
scriptname=$( echo $0 | cut -d "." -f1 )
logfile="$logfolder/$scrpitname.log"

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

dnf list installed mysql &>>$logfile
if [ $? -ne 0 ]; then
dnf install mysql -y &>>$logfile
validate $? "mysql"
else  
   echo -e "mysql is already exist ... $y skipping $n"
fi   

dnf list installed nginx &>>$logfile
if [ $? -ne 0 ]; then
dnf install nginx -y &>>$logfile
validate $? "nginx"
else  
    echo -e "nginx is already exist ... $y skipping $n"
fi   

dnf list installed python3 &>>$logfile
if [ $? -ne 0 ]; then
dnf install python3 -y &>>$logfile
validate $? "python3"
else  
    echo -e "python3 is already exist ... $y skipping $n"
fi   
