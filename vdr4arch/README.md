# Docker image for vdr based on vdr4arch  
VDR container based on vdr4arch with minimal systemd

Start it by running:
`docker run -d --net=host --privileged --name=<containername> \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v /etc/localtime:/etc/localtime:ro \
-v /<recordings_on_host>/:/srv/vdr/video \
chriszero/vdr4arch`



* --net=host				for have a working sat>ip plugin (UPNP)
* -v /sys/fs/cgroup:/sys/fs/cgroup:ro	requirement for systemd

To config your VDR attach a bash to the running container e.g: docker exec -it <containername> /bin/bash -c "export TERM=xterm; exec bash"


