FROM alpine:3.15

ADD src/install.sh install.sh
RUN sh install.sh && rm install.sh

ENV POSTGRES_DATABASE ''
ENV POSTGRES_HOST 'postgres'
ENV POSTGRES_PORT 5432
ENV POSTGRES_USER ''
ENV POSTGRES_PASSWORD ''
ENV PGDUMP_EXTRA_OPTS ''
ENV S3_ACCESS_KEY_ID ''
ENV S3_SECRET_ACCESS_KEY ''
ENV S3_BUCKET ''
ENV S3_REGION 'ru-central1'
ENV S3_PATH 'backup'
ENV S3_ENDPOINT 'https://storage.yandexcloud.net'
ENV S3_S3V4 'no'
ENV SCHEDULE ''
ENV PASSPHRASE ''

ADD src/run.sh run.sh
ADD src/backup.sh backup.sh
ADD src/restore.sh restore.sh

CMD ["sh", "run.sh"]
