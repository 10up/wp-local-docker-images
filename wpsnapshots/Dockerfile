FROM 10up/phpfpm

RUN useradd wpsnapshots && \
    mkdir -p /home/wpsnapshots && \
    mkdir -p /var/www/html && \
    chown -R wpsnapshots:wpsnapshots /home/wpsnapshots && \
    chown -R wpsnapshots:wpsnapshots /var/www/html && \
    su - wpsnapshots -c "composer global require 10up/wpsnapshots:dev-feature/create" \
	&& su - wpsnapshots -c "composer clear-cache"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
