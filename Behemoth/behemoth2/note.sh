#!/bin/bash

mkdir /tmp/ballban
cd /tmp/ballban

/behemoth/behemoth2
ls # 95342
rm 95342
ln -s /etc/behemoth_pass/behemoth3 /tmp/ballban/95342

# wait 3000 seconds
# password: JQ6tZGqt0i