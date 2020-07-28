FROM alpine:3.12

ARG DOCKER_CLI_VER="19.03.9"
ARG DOCKER_CLI_URL="https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLI_VER.tgz"

ARG GOSS_VER="v0.3.13"
ARG GOSS_URL="https://goss.rocks/install"

RUN apk --update --no-cache add \
    bash \
    curl

# Install Docker Client
RUN curl -fsSL $DOCKER_CLI_URL | tar -xz -C /tmp \
 && mv /tmp/docker/docker /usr/local/bin \
 && rm -rf /tmp/docker

# Install Goss
RUN curl -fsSL $GOSS_URL | GOSS_VER=$GOSS_VER GOSS_DST=/usr/local/bin sh

WORKDIR /goss
CMD [ "goss", "--version" ]
