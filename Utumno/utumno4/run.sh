#!/bin/bash
password='qHWLExh7C5'
i=4
port=2227

remote_host="utumno$i@utumno.labs.overthewire.org"
file_path="/utumno/utumno$i*"

if [ ! -e "utumno$i" ]; then
    echo "Downloading utumno$i"
    sshpass -p "$password" sftp -oPort=$port "$remote_host" <<< "get $file_path
    exit"
fi

sshpass -p "$password" ssh -o stricthostkeychecking=no "$remote_host" -p $port