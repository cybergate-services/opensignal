rm -rf ./.env
PASSWORD=$(openssl rand -base64 16)
ACCESS_KEY=$(openssl rand -base64 20)
SECRET_KEY=$(openssl rand -base64 20)

cat coturn/coturn.env > ./.coturn.env
sed -i -e "s/CHANGE_ME/$PASSWORD/g" ./.coturn.env               

cat postgresql/postgresql.env > ./.postgresql.env
sed -i -e "s/CHANGE_ME/$PASSWORD/g" ./.postgresql.env

cat letsencrypt/letsencrypt.env > ./.letsencrypt.env

echo "CHANGE_ME=${PASSWORD}" > ./.env
cat coturn/coturn.env >> ./.env
cat postgresql/postgresql.env >> ./.env
