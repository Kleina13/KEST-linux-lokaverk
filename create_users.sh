#!/bin/bash
# Author: Ragnar & Einar
# ------------------------------------------
INPUT=Linux_Users.CSV
OLDIFS=$IFS # Keep the old seperator for to change back later
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; } # if input is not a file
while read name Fname Lname Uname email dprt eID
do
    grpID=$(cut -d: -f3 < <(getent group $dprt))
    useradd -g $grpID -m -u $eID -c "$name" $Uname
    echo -e "pass123\npass123" | passwd $Uname
    echo "┌────────────────────────────────────────────────────"
    echo "│  User $Uname created"
    echo "│  User detail table"
    echo "├─────────────┬──────────────────────────────────────"
    echo "│ Name        │ $name"
    echo "├─────────────┼──────────────────────────────────────"
    echo "│ First name  │ $Fname"
    echo "├─────────────┼──────────────────────────────────────"
    echo "│ Last name   │ $Lname"
    echo "├─────────────┼──────────────────────────────────────"
    echo "│ Username    │ $Uname"
    echo "├─────────────┼──────────────────────────────────────"
    echo "│ Email       │ $email"
    echo "├─────────────┼──────────────────────────────────────"
    echo "│ Department  │ $dprt - $grpID"
    echo "├─────────────┼──────────────────────────────────────"
    echo "│ Employee ID │ $eID"
    echo "└─────────────┴──────────────────────────────────────"
done < $INPUT
IFS=$OLDIFS
