#!/bin/sh
# `/sbin/setuser memcache` runs the given command as the user `memcache`.
# If you omit that part, the command will be run as root.
export LANG="de_DE.UTF-8"
exec /usr/local/bin/epgd -n -t -p /usr/local/lib/epgd/plugins -c /config
