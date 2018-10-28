#coding:utf-8

from pwn import *

r = remote('pwnable.kr', '2222')

r.recv(1024)
e = :
a=0

while True:
    r.send('------')
    res = r.recv(1024)
    print(res)
    a=a+1
    if a>50:
        break


