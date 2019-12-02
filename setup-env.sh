#!/usr/bin/env bash
rm -rf ./.env
PASSWORD=$(LC_ALL=C </dev/urandom tr -dc A-Za-z0-9 | head -c 28)
ACCESS_KEY=$(openssl rand -hex 16)
SECRET_KEY=$(openssl rand -hex 16)

cat postgresql/postgresql.env > ./.postgresql.env
cat letsencrypt/letsencrypt.env > ./.letsencrypt.env
cat minio/minio.env > ./.minio.env

sed -ie "s/CHANGE_ME/${PASSWORD}/g" ./.postgresql.env
sed -ie "s/CHANGE_ACCESS_KEY/${ACCESS_KEY}/g" ./.minio.env
sed -ie "s/CHANGE_SECRET_KEY/${SECRET_KEY}/g" ./.minio.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
