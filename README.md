# Kafka Practice Stand

Стенд для отработки базовых операций Kafka: создание топика, продюсинг, консюминг, управление offset и retention.

## Быстрый старт

- Запуск брокера: `bash scripts/start.sh`
- Остановка: `bash scripts/stop.sh`

## Админ-утилиты

- Создать топик: `bash scripts/create_topic.sh order_topic`
- Список топиков: `bash scripts/list_topics.sh`
- Изменить retention: `bash scripts/set_retention.sh order_topic 60000`

## Консьюмер

- Читать последние сообщения: `bash scripts/consume.sh order_topic`
- Читать с начала (auto.offset.reset=earliest): `bash scripts/consume.sh order_topic earliest`

Консьюмер интерактивный — остановка `Ctrl+C`.

## Продюсер

- Отправить встроенный пример: `bash scripts/produce.sh order_topic`
- Отправить из файла: `bash scripts/produce.sh order_topic orders/order1.json`

Файл должен быть **в одну строку** (каждая строка — одно сообщение).

## Сценарий упражнения

1. Запустить брокер: `bash scripts/start.sh`
2. Создать `order_topic`: `bash scripts/create_topic.sh order_topic`
3. Запустить консьюмера: `bash scripts/consume.sh order_topic`
4. Отправить заказ: `bash scripts/produce.sh order_topic orders/order1.json` — увидеть сообщение в консоль консьюмера
5. Изменить режим чтения: остановить консьюмера (`Ctrl+C`), затем `bash scripts/consume.sh order_topic earliest`
6. Остановить консьюмера. Отправить ещё пару сообщений: `bash scripts/produce.sh order_topic orders/order2.json` и без файла
7. Включить консьюмера с earliest: `bash scripts/consume.sh order_topic earliest` — увидеть все текущие сообщения
8. Остановить консьюмера. Настроить retention=1 мин: `bash scripts/set_retention.sh order_topic 60000`
9. Подождать ~90 сек
10. Включить консьюмера: `bash scripts/consume.sh order_topic earliest` — сообщений нет (Kafka их удалила)

## Примечания

- Брокер доступен на `localhost:9092`
- Образы: `bitnami/kafka` (KRaft, single-node)
- Все утилиты запускаются внутри контейнера через `docker exec`
