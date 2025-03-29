# use LD_PRELOAD="" to override the default library

# LD_PRELOAD="./preload.so" /utumno/utumno0
gcc preload.c -o preload.so -fPIC -shared -ldl -m32
LD_PRELOAD="./preload.so" /utumno/utumno0
# Hello from 'puts'!

gcc preload2.c -o preload2.so -fPIC -shared -ldl -m32
LD_PRELOAD="./preload2.so" /utumno/utumno0
# f7fdabb0.ffffd3c0.f7fbd159.0804907d.f7fa8e34.ffffd398.0804917d.0804a01d.0804a008.00000000

# Check all strings from previous memory address
gcc preload3.c -o preload3.so -fPIC -shared -ldl -m32
LD_PRELOAD="./preload3.so" /utumno/utumno0
# Read me! :P
# password: ytvWa6DzmL