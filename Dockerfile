FROM node:16-bullseye-slim

MAINTAINER Ravachol Yang <ravachol.yang@gmail.com>

# Common dependencies
RUN apt-get update -qq \
    && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
        git \
        ca-certificates \
    && apt-get clean \
    && rm -rf /var/cache/apt/archives/* \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && truncate -s 0 /var/log/*log

RUN mkdir -p /hexo

WORKDIR /hexo

RUN npm install hexo-cli -g
RUN hexo -v

# Use Bash
CMD ["/usr/bin/bash"]
