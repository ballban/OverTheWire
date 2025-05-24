#!/bin/bash
# somehow maze3 compares argv[1] with 0x1337C0DE
# if it's true, run shell
/maze/maze3 $(python3 -c "import sys; import struct; sys.stdout.buffer.write(struct.pack('I', 0x1337C0DE))")
cat /etc/maze_pass/maze4
# password: vghylBpihH