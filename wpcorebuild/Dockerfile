FROM node:8

RUN npm install -g grunt-cli && \
    mkdir -p /usr/src/app && \
    userdel node

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

WORKDIR /usr/src/app

ENTRYPOINT ["/entrypoint.sh"]
