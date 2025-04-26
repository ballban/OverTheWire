#!/bin/bash
password='sV17oOQTKc'
i=7

remote_host="behemoth$i@narnia.labs.overthewire.org"
file_path="/behemoth/behemoth$i*"

if [ ! -e "behemoth$i" ]; then
    echo "Downloading behemoth$i"
    sshpass -p "$password" sftp -oPort=2221 "$remote_host" <<< "get $file_path
    exit"
fi

sshpass -p "$password" ssh -o stricthostkeychecking=no "$remote_host" -p 2221