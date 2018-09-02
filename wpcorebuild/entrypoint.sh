#!/usr/bin/env bash

echo "Checking USER ID"
www_uid=`stat -c "%u" /usr/src/app`
www_gid=`stat -c "%g" /usr/src/app`

echo "Host user is $www_uid:$www_gid"

if [ ! $www_uid -eq 0 ]; then
	echo "Updating www-data user and group to match host IDs"
	usermod -u $www_uid www-data
	groupmod -g $www_gid www-data
fi

mkdir -p /var/www/.npm
chown www-data:www-data /var/www/.npm

exec su www-data -s /bin/bash -c "$*"
