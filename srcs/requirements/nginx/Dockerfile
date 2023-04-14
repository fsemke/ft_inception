FROM alpine:3.17

EXPOSE 443

RUN apk update && apk upgrade && apk add --no-cache nginx openssl

# SSL Certificate
RUN mkdir -p /etc/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/nginx.key \
	-out /etc/ssl/nginx.crt \
	-subj "/C=DE/ST=Niedersachsen/L=Wolfsburg/O=42Wob/CN=fsemke"

# nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
