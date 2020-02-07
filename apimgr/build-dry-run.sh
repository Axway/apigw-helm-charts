#!/bin/bash
 
#Prompt for user credentials
echo "Enter Docker registry credentials"
read -p "username: " USER
read -s -p "Password (replace the special chars @,\,$,%,etc. with  \@,\\\\,\$,\%): " PASS
echo "***************"

# Run helm install with provided values

helm install --values values.yaml --dry-run --debug --name=${RUNID} --set namespace=${RUNID},cassandra.host0=$(hostname -i),ingress.host=$(hostname -i) --set imageCredentials.username=$USER --set imageCredentials.password=$PASS .


