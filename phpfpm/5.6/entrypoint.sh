#!/usr/bin/env bash

# Ensure we have the host.docker.internal hostname available to linux as well
function fix_linux_internal_host() {
  DOCKER_INTERNAL_HOST="host.docker.internal"

  if ! grep $DOCKER_INTERNAL_HOST /etc/hosts > /dev/null ; then
    DOCKER_INTERNAL_IP=`/sbin/ip route|awk '/default/ { print $3 }'`
    echo -e "$DOCKER_INTERNAL_IP\t$DOCKER_INTERNAL_HOST" | tee -a /etc/hosts > /dev/null
    echo 'Added $DOCKER_INTERNAL_HOST to hosts /etc/hosts'
  fi
}

echo "Checking USER ID"
www_uid=`stat -c "%u" /var/www/html`
www_gid=`stat -c "%g" /var/www/html`

echo "Host user is $www_uid:$www_gid"

if [ ! $www_uid -eq 0 ]; then
    echo "Updating www-data user and group to match host IDs"
    usermod -u $www_uid www-data
    groupmod -g $www_gid www-data

    fix_linux_internal_host
fi

exec "$@"
