#!/bin/bash
whoami

docker-compose -f replica-set-mdb.yml up -d

sleep 3

docker exec mdb-1-rs0 chmod +x /scripts/replica-set-init.sh
docker exec mdb-1-rs0 /scripts/replica-set-init.sh
