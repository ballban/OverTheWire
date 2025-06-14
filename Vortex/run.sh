#!/bin/bash
port=2228
password=$(cat password)
folder_name=$(basename "$PWD")
remote_host="$folder_name@vortex.labs.overthewire.org"
file_path="/vortex/$folder_name*"

if [ ! -e $folder_name ]; then
    echo "Downloading $folder_name"
    sshpass -p "$password" sftp -oPort=$port "$remote_host" <<< "get $file_path
    exit"
fi

sshpass -p "$password" ssh -o stricthostkeychecking=no "$remote_host" -p $port