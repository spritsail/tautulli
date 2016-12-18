FROM alpine:3.4
MAINTAINER Adam Dodman <adam.dodman@gmx.com>

ENV UID=426 UNAME=plexpy GID=990 GNAME=media


RUN addgroup -g $GID $GNAME \
 && adduser -SH -u $UID -G $GNAME -s /usr/sbin/nologin $UNAME \
 && apk --update add git python \
 && mkdir /plexpy && chown $UID:$GID /plexpy

USER $UNAME

RUN git clone https://github.com/drzoidberg33/plexpy.git /plexpy

VOLUME ["/config", "/media"]
EXPOSE 8081

CMD ["python2.7", "/plexpy/PlexPy.py", "--datadir", "/config/plexpy"]
