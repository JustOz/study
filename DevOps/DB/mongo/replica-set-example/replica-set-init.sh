#!/bin/bash

mongosh --port 27021 <<EOF
var config = {
    "_id": "rs0",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "mdb-1-rs0:27021",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "mdb-2-rs0:27022",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "mdb-3-rs0:27023",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF
