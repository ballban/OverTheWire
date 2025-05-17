#!/bin/bash
port=2225
password=$(cat password)
folder_name=$(basename "$PWD")
remote_host="$folder_name@maze.labs.overthewire.org"
file_path="/maze/$folder_name*"

if [ ! -e $folder_name ]; then
    echo "Downloading $folder_name"
    sshpass -p "$password" sftp -oPort=$port "$remote_host" <<< "get $file_path
    exit"
fi

sshpass -p "$password" ssh -o stricthostkeychecking=no "$remote_host" -p $port