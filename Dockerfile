FROM spritsail/alpine:3.7

ARG TAUTULLI_VER=v2.1.14

LABEL maintainer="Spritsail <tautulli@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Tautulli" \
      org.label-schema.url="http://tautulli.com/" \
      org.label-schema.description="A plex monitoring and statistics tool" \
      org.label-schema.version=${TAUTULLI_VER} \
      io.spritsail.version.tautulli=${TAUTULLI_VER}

ENV SUID=905 SGID=900

WORKDIR /tautulli

RUN apk --no-cache add python2 \
 && wget -O- https://github.com/Tautulli/Tautulli/tarball/${TAUTULLI_VER} \
        | tar xz --strip-components=1 \
# https://github.com/Tautulli/Tautulli/blob/master/plexpy/versioncheck.py#L120
 && printf "$TAUTULLI_VER" > version.txt

VOLUME ["/config", "/media"]
EXPOSE 8081

CMD ["python2", "/tautulli/Tautulli.py", "--datadir", "/config", "--nolaunch", "--verbose"]
