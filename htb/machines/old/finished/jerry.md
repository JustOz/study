# Jerry's IP
```
10.129.136.9
```

# SSH Tunneling
```
ssh -L 10000:10.129.136.9:8080 htb-b301@htb-cjbnqmmojq.htb-cloud.com
```

# Access
```
http://10.129.136.9:8080/manager [credentials: tomcat | s3cret]
```

# DETAILS
### [Article about Tomcat .war reverse shell](https://vk9-sec.com/apache-tomcat-manager-war-reverse-shell/)