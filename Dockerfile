FROM debian:jessie
LABEL author="quick.es@gmail.com"
LABEL description="yandex disk"

ENV DATA="/data" \
    INTERVAL="60" \
    EXCLUDE="" \
    USER="" \
    PASSWORD="" \
    token="/yandex/passwd" \
    OPTIONS=""
COPY entrypoint.sh /
RUN apt update && apt install -y wget \
    && echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | tee -a /etc/apt/sources.list.d/yandex.list > /dev/null \
    && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | apt-key add - \
    && apt-get update \
    && apt-get install -y yandex-disk \
    && chmod +x /entrypoint.sh \
    && useradd -ms /bin/bash user \
    && mkdir /yandex && chmod 777 /yandex

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "start" ]
