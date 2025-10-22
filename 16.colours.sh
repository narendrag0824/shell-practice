#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo -e "error::please run as sudo user"
    exit 1
fi

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

validate(){
  if [ $1 -ne 0 ]; then
      echo -e "installing $2...$r is failed $n"
      exit 1
  else
      echo -e "installing $2...$g is sucess $n"
  fi      
}

dnf list installed mysql
if [ $? -ne 0 ]; then
dnf install mysql -y
validate $? "mysql"
else  
   echo "mysql is already exist...$y skipping $n"
fi   

dnf list installed nginx
if [ $? -ne 0 ]; then
dnf install nginx -y
validate $? "nginx"
else  
    echo "nginx is already exist...$y skipping $n"
fi   

dnf list installed python3
if [ $? -ne 0 ]; then
dnf install python3 -y
validate $? "python3"
else  
    echo "python3 is already exist...$y skipping $n"
fi   