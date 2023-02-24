# Stocker's IP
```
10.129.225.170
```

# Port Forwarding
```
ssh -L 80:stocker.htb:80 htb-b301@htb-aa6gz9labx.htb-cloud.com
OepuZoKP
```

# Enumeration
```
ports 22 and 80 are open
access by "10.129.225.170 stocker.htb >> /etc/hosts"

Author: Holger Koenemann
```

# Subdomain Enumeration
```
gobuster vhost -u http://stocker.htb/ -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt
```

# NoSQL Injection to get past the login page
# XSS SSRF via Dynamic PDF
```
find that the /api/po uses dynamic pdfs
inject it with an <iframe> and src=file://<path>
profit
```


# Creds
```
angoose
IHeardPassphrasesArePrettySecure
```

# user.txt
```
18bdcb1c3aa26f5062d7b3dfcca5e072
```

# Easy PrivEsc
```
https://gtfobins.github.io/gtfobins/node/
```

# root.txt
```
15200376fd11b6e2e0b929a2feeee29c
```