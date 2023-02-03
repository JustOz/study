# 10.129.96.142


# tunnel
```
ssh -L 80:10.129.96.142:80 htb-b301@htb-cjbnqmmojq.htb-cloud.com
```

# nmap enum
```
Discovered open port 80/tcp on 10.129.96.142 http
Discovered open port 139/tcp on 10.129.96.142 samba
Discovered open port 445/tcp on 10.129.96.142 samba
Discovered open port 135/tcp on 10.129.96.142
Discovered open port 21/tcp on 10.129.96.142 ftp
```

# user.txt
```
8029dab4dd8ebe2d9d77b68497982925
```


# credentials
```
prtgadmin
PrTg@dmin2019
```

# gain shell via metasploit

