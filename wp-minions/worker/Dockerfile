FROM 10up/phpfpm:latest

RUN apt-get update \
	&& apt-get install -y supervisor \
	&& apt-get autoremove -y \
	&& apt-get clean

RUN mkdir -p /var/log/supervisor
RUN mkdir -p /etc/supervisord.d

CMD ["/usr/bin/supervisord", "-n"]
