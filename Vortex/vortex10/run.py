import subprocess

process = subprocess.Popen(
    ["/vortex/vortex10"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=False
)

outputs = process.stdout.readline().decode().strip()
print("Program output:", outputs)

# Process input text to int list
outputs = outputs.replace("[", "").replace("]", "").replace(" ", "").split(",")
outputs = [int(x, 16) for x in outputs if x]


def modinv(a, m):
    t, new_t = 0, 1
    r, new_r = m, a
    while new_r != 0:
        q = r // new_r
        t, new_t = new_t, t - q * new_t
        r, new_r = new_r, r - q * new_r
    if t < 0:
        t += m
    return t


a = 1103515245
c = 12345
m = 2**31
inv_a = modinv(a, m)

# backtrack from the first output to the original seed
state = outputs[0]
for _ in range(len(outputs)):
    state = ((state - c) * inv_a) % m

print("Recovered seed:", state)

seed_bytes = int.to_bytes(state, 4, "little")
print("Seed bytes:", seed_bytes)

process.stdin.write(seed_bytes + b"\n")
process.stdin.flush()
process.stdin.close()

response = process.stdout.read().decode().strip()
print("Final response:", response)
