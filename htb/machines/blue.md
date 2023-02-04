# pwnbox
```
htb-b301@htb-mcnyx43ady.htb-cloud.com
hlzcsxYf
```

# target
```
10.129.209.187
```

# nmap scan
```
PORT      STATE SERVICE      REASON  VERSION
135/tcp   open  msrpc        syn-ack Microsoft Windows RPC
139/tcp   open  netbios-ssn  syn-ack Microsoft Windows netbios-ssn
445/tcp   open  microsoft-ds syn-ack Windows 7 Professional 7601 Service Pack 1 microsoft-ds (workgroup: WORKGROUP)
49152/tcp open  msrpc        syn-ack Microsoft Windows RPC
49153/tcp open  msrpc        syn-ack Microsoft Windows RPC
49154/tcp open  msrpc        syn-ack Microsoft Windows RPC
49155/tcp open  msrpc        syn-ack Microsoft Windows RPC
49156/tcp open  msrpc        syn-ack Microsoft Windows RPC
49157/tcp open  msrpc        syn-ack Microsoft Windows RPC
Service Info: Host: HARIS-PC; OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| smb-security-mode:
|   account_used: guest
|   authentication_level: user
|   challenge_response: supported
|_  message_signing: disabled (dangerous, but default)
| smb2-security-mode:
|   2.1:
|_    Message signing enabled but not required
| smb2-time:
|   date: 2023-02-04T11:23:03
|_  start_date: 2023-02-04T11:20:57
| p2p-conficker:
|   Checking for Conficker.C or higher...
|   Check 1 (port 50592/tcp): CLEAN (Couldn't connect)
|   Check 2 (port 44404/tcp): CLEAN (Couldn't connect)
|   Check 3 (port 3577/udp): CLEAN (Timeout)
|   Check 4 (port 34247/udp): CLEAN (Failed to receive data)
|_  0/4 checks are positive: Host is CLEAN or ports are blocked
| smb-os-discovery: 
|   OS: Windows 7 Professional 7601 Service Pack 1 (Windows 7 Professional 6.1)
|   OS CPE: cpe:/o:microsoft:windows_7::sp1:professional
|   Computer name: haris-PC
|   NetBIOS computer name: HARIS-PC\x00
|   Workgroup: WORKGROUP\x00
|_  System time: 2023-02-04T11:22:59+00:00
|_clock-skew: mean: 3s, deviation: 0s, median: 3s
```

# samba
```
smbclient -N -L \\\\10.129.209.187\\WORKGROUP

        Sharename       Type      Comment
        ---------       ----      -------
        ADMIN$          Disk      Remote Admin
        C$              Disk      Default share
        IPC$            IPC       Remote IPC
        Share           Disk
        Users           Disk
```

# use eternalblue on metasploit


# root.txt
```
37b58e000429b94a875f176dc8d80ac3
```

# user.txt
```
d27479bdd5be6f6e93c276df3cf1636b
```

# got root before user?  o -o


# from writeups:
```
smbmap -H 10.10.10.40 -u "0xdf -p "0xdf [enumeration]
nmap -p 445 -script vuln -oA scans/nmap-smbvulns 10.10.10.40 [checks known vulnerabilities]

```