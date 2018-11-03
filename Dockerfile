FROM kubernetes/pause:latest AS pause

FROM golang:1.11
COPY --from=pause /pause /usr/local/bin/pause

RUN apt-get update -y && apt-get install -y \
       vim

#ENV DOCKERVERSION=18.06.1-ce
#RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
#       && tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 -C /usr/local/bin docker/docker \
#       && rm docker-${DOCKERVERSION}.tgz

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
