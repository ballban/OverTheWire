# 

/utumno/utumno1 /tmp/ballban_utumno1


# use LD_PRELOAD="" to override the default library

# LD_PRELOAD="./preload.so" /utumno/utumno0
gcc preload.c -o preload.so -fPIC -shared -ldl -m32
LD_PRELOAD="./preload.so" /utumno/utumno1 /tmp/ballban_utumno1