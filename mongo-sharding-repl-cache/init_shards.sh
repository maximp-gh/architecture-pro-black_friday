#!/bin/bash

## Инициализируем shard1
docker compose exec -T shard1_1 mongosh --port 27018 <<EOF
rs.initiate(
    {
      _id : "shard1",
      members: [
        { _id : 0, host : "shard1_1:27018" },
        { _id : 1, host : "shard1_2:27021" },
        { _id : 2, host : "shard1_3:27022" },
      ]
    }
);
EOF

sleep 3

## Инициализируем shard2
docker compose exec -T shard2_1 mongosh --port 27019 <<EOF
rs.initiate(
    {
      _id : "shard2",
      members: [
        { _id : 0, host : "shard2_1:27019" },
        { _id : 1, host : "shard2_2:27023" },
        { _id : 2, host : "shard2_3:27024" },
      ]
    }
);
EOF