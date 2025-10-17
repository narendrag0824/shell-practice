#!/bin/bash

#if id is zero then proceed otherwise stop

userid=$(id -u)

if [ $userid -ne 0 ]; then
   echo "error::pls run as a sudo user"
   exit 1
fi

dnf install mysql -y

if [ $? -ne 0 ];then
  echo "error::installing is failed"
  exit 1
  
 else
   echo "installing my sql server is success"
   exit 0
 fi   

 dnf install nginx -y

 if [ $? -ne 0 ];then
   echo "error"
   exit 1
else
  echo "install"
  fi   
