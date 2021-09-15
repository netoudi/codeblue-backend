FROM node:14.17-alpine3.14

RUN apk update

RUN apk add --no-cache bash mysql-client

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

## config bash
RUN touch /home/node/.bashrc | echo "PS1='\w \$ '" >> /home/node/.bashrc

RUN npm install -g @nestjs/cli@8.0.0

USER node

WORKDIR /home/node/app
