FROM johnpbloch/phpfpm:7.2

RUN curl -L https://phar.phpunit.de/phpunit.phar > /tmp/phpunit.phar \
	&& chmod +x /tmp/phpunit.phar \
	&& mv /tmp/phpunit.phar /usr/local/bin/phpunit

RUN apt-get update && apt-get install -y \
		git \
		subversion \
		wget \
		libxml2-dev \
		ssmtp \
		imagemagick \
		libmagickwand-dev \
		unzip \
	&& pecl install imagick \
	&& docker-php-ext-enable imagick \
	&& docker-php-ext-install soap \
	&& echo "mailhub=mailcatcher:1025\nUseTLS=NO\nFromLineOverride=YES" > /etc/ssmtp/ssmtp.conf \
	&& apt-get remove -y libmagickwand-dev libxml2-dev \
	&& apt-get autoremove -y \
	&& apt-get clean

CMD ["php-fpm"]

EXPOSE 9000
