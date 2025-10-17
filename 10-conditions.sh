#!/bin/bash

echo " please enter the number"
read number
if [$(($number % 2)) -eq 0]; then
    echo " the given $number is even"
else
    echo " then given $number is odd"
fi        
