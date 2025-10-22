#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]; then
    echo "error::please use this in sudo user"
    exit 1
fi

dnf install mysql -y

 if [ $? -ne 0 ];then
    echo "error::installing mysql is failure"
    exit 1
 else 
     echo "installing mysql is success"
 fi

   dnf install nginx -y

 if [ $? -ne 0 ];then
    echo "error::installing nginx is failure"
    exit 1
 else 
     echo "installing nginx is success"
 fi    

 dnf install phyton3 -y

 if [ $? -ne 0 ];then
    echo "error::installing phyton3 is failure"
    exit 1
 else 
     echo "installing phyton3 is success"
fi 