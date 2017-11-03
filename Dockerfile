FROM debian
RUN apt-get update \
 && apt-get install -y wget \
 && rm -rf /var/lib/apt/lists/*
RUN wget -O- https://bin.equinox.io/c/2ovkwS9YHaP/edgetunnels-stable-linux-amd64.tgz | tar xz

FROM debian
COPY --from=0 cloudflare-warp /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["cloudflare-warp"]
