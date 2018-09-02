#!/usr/bin/env bash

echo "Checking USER ID"
www_uid=`stat -c "%u" /home/wpsnapshots/.wpsnapshots`
www_gid=`stat -c "%g" /home/wpsnapshots/.wpsnapshots`

echo "Host user is $www_uid:$www_gid"

if [ ! $www_uid -eq 0 ]; then
	echo "Updating wpsnapshots user and group to match host IDs"
	usermod -u $www_uid wpsnapshots
	groupmod -g $www_gid wpsnapshots
fi

exec su - wpsnapshots -c "cd /var/www/html; /home/wpsnapshots/.composer/vendor/bin/wpsnapshots $*"
