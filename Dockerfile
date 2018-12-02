FROM spritsail/alpine:3.8

ARG TAUTULLI_VER=2.1.26

LABEL maintainer="Spritsail <tautulli@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Tautulli" \
      org.label-schema.url="https://tautulli.com/" \
      org.label-schema.description="A Plex monitoring and statistics tool" \
      org.label-schema.version=${TAUTULLI_VER} \
      io.spritsail.version.tautulli=${TAUTULLI_VER}

ENV SUID=905 SGID=900

WORKDIR /tautulli

RUN apk --no-cache add python2 py-setuptools \
 && wget -O- https://github.com/Tautulli/Tautulli/tarball/v${TAUTULLI_VER} \
        | tar xz --strip-components=1 \
# https://github.com/Tautulli/Tautulli/blob/master/plexpy/versioncheck.py#L120
 && printf "v$TAUTULLI_VER" > version.txt

VOLUME ["/config", "/media"]
EXPOSE 8081

CMD ["python2", "/tautulli/Tautulli.py", "--datadir", "/config", "--nolaunch", "--verbose"]
