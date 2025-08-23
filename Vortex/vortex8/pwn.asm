section	.text
    global _start

_start:
    mov ecx, 0x804c004
    mov ebx, 0xffffdd77
    mov [ecx], ebx