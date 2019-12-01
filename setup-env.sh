#!/usr/bin/env bash
rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
ACCESS_KEY=$(uuidgen | sha1sum)
SECRET_KEY=$(uuidgen | sha1sum)
     
cat postgresql/postgresql.env > ./.postgresql.env
cat letsencrypt/letsencrypt.env > ./.letsencrypt.env
cat minio/minio.env > ./.minio.env

sed -ie "s/CHANGE_ME/${PASSWORD}/g" ./.postgresql.env
sed -ie "s/CHANGE_ACCESS_KEY/${ACCESS_KEY}/g" ./.minio.env
sed -ie "s/CHANGE_SECRET_KEY/${SECRET_KEY}/g" ./.minio.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
