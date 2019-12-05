#!/usr/bin/env bash
rm -rf ./.env

PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
ACCESS_KEY=$(openssl rand -hex 16)
SECRET_KEY=$(openssl rand -hex 16)

#cat postgresql/accountdb.env > ./.accountdb.env
#cat postgresql/messagedb.env > ./.messagedb.env
cat postgresql/postgres.env > ./.postgres.env

cat letsencrypt/letsencrypt.env > ./.letsencrypt.env
cat minio/minio.env > ./.minio.env

sed -ie "s/CHANGE_ME/${PASSWORD}/g" ./.postgres.env
#sed -ie "s/CHANGE_ME/${PASSWORD}/g" ./.accountdb.env
#sed -ie "s/CHANGE_ME/${PASSWORD}/g" ./.messagedb.env

sed -ie "s/CHANGE_ACCESS_KEY/${ACCESS_KEY}/g" ./.minio.env
sed -ie "s/CHANGE_SECRET_KEY/${SECRET_KEY}/g" ./.minio.env

sed -ie "s/SQS_ACCESS_KEY/${ACCESS_KEY}/g" ./conf/sqs/config_local.json
sed -ie "s/SQS_SECRET_KEY/${SECRET_KEY}/g" ./conf/sqs/config_local.json
cat ./conf/signal/Signal.yml.tmpl > ./conf/signal/Signal.yml
sed -ie "s/SQS_ACCESS_KEY/${ACCESS_KEY}/g" ./conf/signal/Signal.yml
sed -ie "s/SQS_SECRET_KEY/${SECRET_KEY}/g" ./conf/signal/Signal.yml

sed -ie "s/MINIO_ACCESS_KEY/${ACCESS_KEY}/g" ./conf/signal/Signal.yml
sed -ie "s/MINIO_SECRET_KEY/${SECRET_KEY}/g" ./conf/signal/Signal.yml

sed -ie "s/CHANGE_ME/${PASSWORD}/g" ./conf/signal/Signal.yml

echo "CHANGE_ME=${PASSWORD}" > ./.env
