#!/bin/bash
if [ -z "$HAPROXY_USERNAME" ]; then
    export HAPROXY_USERNAME="admin"
fi  

if [ -z "$HAPROXY_URI" ]; then
    export HAPROXY_URI="/haproxy?stats"
fi  

if [ -n "$HAPROXY_PASSWORD" ]
then
  echo "	stats enable\n" >> /etc/haproxy/haproxy.cfg
  echo "	stats auth $HAPROXY_USERNAME:$HAPROXY_PASSWORD\n" >> /etc/haproxy/haproxy.cfg
  echo "	stats uri $HAPROXY_URI\n" >> /etc/haproxy/haproxy.cfg
fi

service haproxy start
exec yes > /dev/null
