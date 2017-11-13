#!/usr/bin/env bash

if [ "${1:0:1}" = '-' ]; then
	set -- cloudflare-warp "$@"
fi

if [ -v ORIGIN_CERT_CONTENT ]; then
	export -n ORIGIN_CERT_CONTENT
	exec "$@" --origincert=<(echo "$ORIGIN_CERT_CONTENT")
fi

exec "$@"
