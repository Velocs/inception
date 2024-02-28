FROM debian:bullseye

RUN apt update -y -qq &&\
	apt upgrade -y -qq &&\
	apt install -y -qq nginx openssl

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx

RUN mkdir /etc/nginx/ssl

# Genera un certificato SSL autofirmato per HTTPS
RUN openssl req -x509 -nodes -days 365 \
    -newkey rsa:2048 -keyout /etc/nginx/ssl/aliburdi.key \
    -out /etc/nginx/ssl/aliburdi.crt \
    -subj "/C=IT/L=RM/O=42_Roma/OU=aliburdi/CN=aliburdi"

# Espone la porta 443 per le connessioni HTTPS
EXPOSE 443

# Avvia il server nginx in primo piano (foreground)
CMD ["nginx", "-g", "daemon off;"]
