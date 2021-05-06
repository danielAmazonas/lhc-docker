# Intalação do Live Helper Chat - LHC:

Para efetuar uma nova instalação de forma automática, é necessário:

- Instalar do docker-compose e;
- `git clone https://github.com/danielAmazonas/lhc-docker.git`
- `cd lhc-docker`
- `./nova_instalacao.sh`

Para a instalação manual, faça:

- Instalar do docker-compose e;
- `git clone https://github.com/danielAmazonas/lhc-docker.git`
- `cd lhc-docker`
- `docker-compose build`
- `docker-compose up -d`
- `./get_lhc_master.sh`
- `chown -R www-data: Live*`
- `mv Live*/lhc_web/* ./html/`
- `rm -rf Live*`

O `docker-compose.yml` está montando os seguintes volumes, e utilizando a porta 8002 como padrão:

- `./html:/var/www/html`
- `./logs:/var/log/`

E acessar `http://localhost:8002` para concluir a instalação. É necessário a criação de uma base de dados `MySQL` para prosseguir.

## Segue a estrutura do `docker-compose.yml`:

```
version: '3'
services:
  lhc-new:
    container_name: lhc-new
    build: .
    ports:
      - "8002:80"
    restart: always
    networks:
      - lhc-new
    volumes:
      - ./html:/var/www/html
      - ./logs:/var/log/

networks:
  lhc-new:
    driver: bridge
```

## Estrutura do `Dockerfile`:

```
FROM php:7.4.18-apache-buster

EXPOSE 80

RUN apt-get update \
  && apt-get -y install libfreetype6-dev libjpeg62-turbo-dev libpng-dev libwebp-dev \
  && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
  && docker-php-ext-install -j$(nproc) gd \
  && docker-php-ext-install pdo pdo_mysql \
  && docker-php-ext-install bcmath

RUN rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get clean
```
