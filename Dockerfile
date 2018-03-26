FROM alpine:3.7

ARG TAUTULLI_VER=HEAD

LABEL maintainer="Spritsail <tautulli@spritsail.io>" \
      org.label-schema.vendor="Spritsail" \
      org.label-schema.name="Tautulli" \
      org.label-schema.url="http://tautulli.com/" \
      org.label-schema.description="A plex monitoring and statistics tool" \
      org.label-schema.version=${TAUTULLI_VER} \
      io.spritsail.version.tautulli=${TAUTULLI_VER}


ENV UID=905 UNAME=tautulli GID=900 GNAME=media


RUN addgroup -g $GID $GNAME \
 && adduser -SH -u $UID -G $GNAME -s /usr/sbin/nologin $UNAME \
 && apk --update --no-cache add git python \
 && mkdir /tautulli && chown $UID:$GID /tautulli

USER $UNAME

RUN git clone https://github.com/Tautulli/Tautulli.git /tautulli \
 && git -C /tautulli reset --hard ${TAUTULLI_VER}

VOLUME ["/config", "/media"]
EXPOSE 8081

ENTRYPOINT ["python2.7", "/plexpy/PlexPy.py", "--datadir", "/config"]
