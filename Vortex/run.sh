#!/bin/bash
port=2228
password=$(cat password)
folder_name=$(basename "$PWD")
remote_host="$folder_name@vortex.labs.overthewire.org"
file_path="/vortex/$folder_name*"

echo "Checking if executable exists on local machine"
if [ ! -e $folder_name ]; then
    echo "Downloading $folder_name"
    sshpass -p "$password" sftp -oPort=$port "$remote_host" <<< "get $file_path
    exit"
fi

echo "Executing sshpass"
sshpass -p "$password" ssh -o stricthostkeychecking=no -o ServerAliveInterval=60 -o ServerAliveCountMax=3 "$remote_host" -p $port