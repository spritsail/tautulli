FROM spritsail/alpine:3.14

ARG TAUTULLI_VER=2.9.6
ARG TAUTULLI_BRANCH=master
ARG TIMEZONE=Etc/UTC

LABEL maintainer="Spritsail <tautulli@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Tautulli" \
      org.label-schema.url="https://tautulli.com/" \
      org.label-schema.description="A Plex monitoring and statistics tool" \
      org.label-schema.version=${TAUTULLI_VER} \
      io.spritsail.version.tautulli=${TAUTULLI_VER}

ENV SUID=905 SGID=900
# Disable updates when using Docker container
# https://github.com/Tautulli/Tautulli/commit/8690d2ced5e5afe8c8f3342881d478fed37c274d
ENV TAUTULLI_DOCKER=True

WORKDIR /tautulli

RUN apk --no-cache add python3 py-setuptools tzdata \
 && wget -O- https://github.com/Tautulli/Tautulli/tarball/v${TAUTULLI_VER} \
        | tar xz --strip-components=1 \
# https://github.com/Tautulli/Tautulli/blob/master/plexpy/versioncheck.py#L120
 && printf "v$TAUTULLI_VER" > version.txt \
 && printf "$TAUTULLI_BRANCH" > branch.txt \
# Fix pytz default timezone to UTC
 && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
 && apk --no-cache del tzdata

VOLUME ["/config", "/media"]
EXPOSE 8081

HEALTHCHECK --start-period=10s --timeout=5s \
    CMD wget -qO /dev/null "http://localhost:8181/status"

CMD ["python3", "/tautulli/Tautulli.py", "--datadir", "/config", "--nolaunch", "--verbose"]
