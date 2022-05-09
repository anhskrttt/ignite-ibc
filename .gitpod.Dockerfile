# syntax = docker/dockerfile:1.2
# WARNING! Use `DOCKER_BUILDKIT=1` with `docker build` to enable --mount feature.

## prep the base image.
#
FROM golang:1.18.0-bullseye as base

RUN apt update && \
    apt-get install -y \
        build-essential \
        ca-certificates \
        curl && \
    curl https://get.ignite.com/cli! | bash && \
    curl https://get.ignite.com/cli | bash && \
    sudo mv ignite /usr/local/bin/

# enable faster module downloading.
ENV GOPROXY https://proxy.golang.org

# see docs for exposed ports:
#   https://docs.ignite.com/kb/config.html#host
EXPOSE 26657
EXPOSE 26656
EXPOSE 6060 
EXPOSE 9090 
EXPOSE 1317 

ENTRYPOINT ["ignite"]