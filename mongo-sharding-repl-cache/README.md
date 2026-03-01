# pymongo-api - с шардами и репликацией

## Как запустить

Запускаем mongodb и приложение

```shell
docker compose up -d
```

Инициализируем сервер конфигурации

```shell
./init_config.sh
```

Инициализируем шарды c репликами
```shell
./init_shards.sh
```

Инициализируем роутер и наполняем базу данными
```shell
./init_router.sh
```

Инициализируем кэш
```shell
./init_redis.sh
```

docker exec -it redis_1 sh
> redis-cli --cluster create   173.17.0.11:6379   173.17.0.12:6379   173.17.0.13:6379   173.17.0.14:6379   173.17.0.15:6379   173.17.0.16:6379   --cluster-replicas 1

ответить "yes".
выйти из redis shell.

## Как проверить

 /helloDoc/users

