# Контейнер для yandex диска

Позволяет использовать облачный диск яндекса в произвольных комбинациях с другими контейнерами или локальными хранилищами.
Подробно опции описаны [на сайте яндекса](https://yandex.ru/support/disk/cli-clients.html#cli-daemon)

Пример запуска контейнера от текущего пользователя
```bash
docker run -it --name ya_disk \
    -u 1000 \
    -e "USER=login@domen" \
    -e "PASSWORD=your_password" \
    -e "OPTIONS=" \
    -v "${PWD}/disk:/data" \
    quickes/yandex:disk start
```
Диск синхронизируется в путь /data, поэтому мапить надо его