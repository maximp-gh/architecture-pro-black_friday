# pymongo-api - с шардами,  репликацией и кэшем

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
docker exec -it redis_1 sh
> redis-cli --cluster create   173.17.0.11:6379   173.17.0.12:6379   173.17.0.13:6379   173.17.0.14:6379   173.17.0.15:6379   173.17.0.16:6379   --cluster-replicas 1
```

 - ответить "yes".
 - выйти из redis shell.

## Проверка

/helloDoc/users должен грузится побыстрее при повторных обращениях

