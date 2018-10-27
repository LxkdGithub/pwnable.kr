#coding:utf-8

from pwn import *

conn = remote('pwnable.kr', 9007)
conn.recv(10024)
for i in range(100):
    
    line = conn.recv(1024).decode('UTF-8').strip().split(' ')
    print(line[0],line[1])
    n = int(line[0].split('=')[1])
    c = int(line[1].split('=')[1])
    left = 0
    right = n
    for _ in range(c):
        guess = ' '.join(str(num) for num in range(left, int((right+left)/2)))
        conn.sendline(guess)
        r = int(conn.recv(1024).decode("UTF-8").strip())
        if r%10 == 0:
             left = int((right+left)/2)
        else:
            right = int((right+left)/2)
    conn.sendline(str(left))
    print(conn.recv(1024).decode('UTF-8'))
print(conn.recv(1024).decode('UTF-8'))
conn.close()

