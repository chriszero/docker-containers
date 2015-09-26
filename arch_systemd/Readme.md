Minimal Archlinux with systemd/journald

take it as a base for your own images

it's mandatory to link /sys/fs/cgroup from tot host to the container!
docker run -d --name=<containername> -v /sys/fs/cgroup:/sys/fs/cgroup:ro <imagename>

Attach a bash to the running container e.g: docker exec -it <containername> /bin/bash -c "export TERM=xterm; exec bash"
