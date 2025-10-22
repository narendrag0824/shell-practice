#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "error::please run as sudo user"
    exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
      echo "error::installing $2 is failed"
      exit 1
  else
      echo "installing $2 is sucess"
  fi      
}

dnf install mysql -y
validate $? "mysql"

dnf install nginx -y
validate $? "nginx"

dnf install python3 -y
validate $? "python3"