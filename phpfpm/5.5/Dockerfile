FROM johnpbloch/phpfpm:5.5

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
	&& apt-get clean \
	&& mkdir /var/www/.wp-cli \
	&& chown www-data:www-data /var/www/.wp-cli
	
RUN XDEBUG=$(find / -name 'xdebug.so' | head -n 1 | tail -n 1) \
	&& ln -s $XDEBUG /usr/local/lib/php/extensions/xdebug.so

CMD ["php-fpm"]

EXPOSE 9000
