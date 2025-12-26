#!/bin/bash
first_name=$1
last_name=$2
show=$3
if [ "$show" = "true" ]; then 
   echo "Hello, $first_name $last_name"
else
   echo "please mark the show option"
fi