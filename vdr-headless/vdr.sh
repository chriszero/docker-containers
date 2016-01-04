#!/bin/sh
# `/sbin/setuser vdr` runs the given command as the user `vdr`.
# If you omit that part, the command will be run as root.
export LANG="de_DE.UTF-8"

# Set the uid:gid to run as
[ "$vdr_uid" ] && usermod  -o -u "$vdr_uid" vdr
[ "$vdr_gid" ] && groupmod -o -g "$vdr_gid" vdr

# Set folder permissions
# chown -r /recordings only if owned by root. We asume that means it's a docker volume
[ "$(stat -c %u:%g /recordings)" = "0:0" ] && chown vdr:vdr /recordings


#if [ "$pipework_wait" ]; then
#	for _pipework_if in $pipework_wait; do
#		echo "Waiting for pipework to bring up $_pipework_if..."
#		pipework --wait -i $_pipework_if
#	done
#	sleep 1
#fi

# Restrict the ipv4 Portrange
echo "40000 40100" >/proc/sys/net/ipv4/ip_local_port_range

# Run vdr
exec s6-setuidgid vdr vdr

