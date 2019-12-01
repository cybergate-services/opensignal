rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
ACCESS_KEY=$(openssl rand -base64 20)
SECRET_KEY=$(openssl rand -base64 20)
     
cat postgresql/postgresql.env > ./.postgresql.env
sed -i -e "s/CHANGE_ME/$PASSWORD/g" ./.postgresql.env

cat minio/minio.env > ./.minio.env
sed -i -e "s/CHANGE_ACCESS_KEY/$ACCESS_KEY/g" ./.minio.env
sed -i -e "s/CHANGE_SECRET_KEY/$SECRET_KEY/g" ./.minio.env

cat letsencrypt/letsencrypt.env > ./.letsencrypt.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
