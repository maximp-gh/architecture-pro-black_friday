#!/bin/bash

## Инициализируем роутер и наполняем данными
docker compose exec -T mongos_router mongosh --port 27020 <<EOF

sh.addShard( "shard1/shard1_1:27018,shard1_2:27021,shard1_3:27022");
sh.addShard( "shard2/shard2_1:27019,shard2_2:27023,shard2_3:27024");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})
db.helloDoc.countDocuments() 
EOF