FROM nginxproxy/nginx-proxy:latest

COPY certs/ /etc/nginx/certs
COPY nginx.tmpl /app/nginx.tmpl
COPY 503.html /usr/share/nginx/html/503.html
