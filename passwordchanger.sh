#!/bin/bash


currentpw=$(aws secretsmanager get-secret-value --secret-id test2 --query SecretString --output text)
newpw=$(aws secretsmanager get-random-password --require-each-included-type --password-length 14 --output text)


echo -e "$currentpw""\n""$newpw""\n""$newpw""\n""$newpw"|smbpasswd -U test2 -r 172.31.0.132
if [ $? -eq 0 ]; then
    echo "Password Change Successfully"
else 
    echo "Password Changed Failed"
fi 

# Update Secrets Manager with new Random Generated PW
aws secretsmanager update-secret --secret-id test2 --secret-string "$newpw"
if [ $? -eq 0 ]; then
    echo "New PW Stored Successfully"
else 
    echo "Password not Stored in Secrets Manager"
fi 