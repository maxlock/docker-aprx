FROM debian

ENV VERSION=1.6

RUN apt-get update && apt-get install --no-install-recommends -y \
    tini \
    aprx \
    && rm -rf /var/lib/apt/lists/* \
    && addgroup --gid 10001 aprx \
    && adduser --system --uid 10001 --gid 10001 aprx \
    && mkdir /run/aprx \
    && chown aprx:aprx /run/aprx

VOLUME /aprx

ENTRYPOINT ["/usr/bin/tini", "--", "/usr/sbin/aprx"]

USER aprx

CMD ["-f","/aprx/aprx.conf","-i"]
