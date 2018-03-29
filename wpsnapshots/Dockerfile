FROM 10up/phpfpm

ENV COMPOSER_ALLOW_SUPERUSER 1

RUN composer global require 10up/wpsnapshots \
	&& composer clear-cache

ENV PATH="/root/.composer/vendor/bin:${PATH}"

COPY ./snapshots.sh /

CMD [ "sh", "-c", "trap 'echo dying; exit' SIGINT SIGTERM; while true; do sleep 2; done"]
